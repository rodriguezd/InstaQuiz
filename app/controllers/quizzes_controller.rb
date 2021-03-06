class QuizzesController < ApplicationController
  load_and_authorize_resource

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quizzes }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz = Quiz.find(params[:id])
    @users = @quiz.users

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.json
  def new
    @quiz = current_user.quizzes.build(:name => params[:name])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(params[:quiz])
    @quiz.num_choices = params[:num_choices]
    date = params[:deadline_date]
    deadline = "#{date[3,2]}/#{date[0,2]}/#{date[6,4]}"
    @quiz.deadline_date = deadline
    @quiz.deadline_time = params[:deadline_time]
    @quiz.instructor = current_user.id
    if params.has_key?(:group_code)
      params[:group_code].each do |code|
        @quiz.groups << Group.where(:code => code)
      end
    else
      @quiz.valid?
      @quiz.errors[:base] << "Must select at least one group"
      render action: 'new'
      return
    end

    @quiz.update_attribute(:status, 'pending')

    if !params[:copy].blank?
      quiz_to_copy = Quiz.find(params[:copy])
      quiz_to_copy.questions.each do |question|
        new_question = question.dup
        new_question.update_attribute(:quiz_id, @quiz.id)
        @quiz.questions << new_question
        question.choices.each do |choice|
          new_choice = choice.dup
          new_choice.update_attribute(:question_id, new_question.id)
          new_question.choices << new_choice
        end
        new_question.save
      end
    end
    # @users.each{|user| user.student_quizzes.create(:quiz_id => @quiz.id, :quiz_status => "pending")}

    respond_to do |format|
      if @quiz.save
        @quiz.groups.each do |group|
          group.users.each{|user| user.student_quizzes.create(:quiz_id => @quiz.id, :quiz_status => "pending")}
        end
        # @quiz.questions_email ###
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render json: @quiz, status: :created, location: @quiz }
      else
        format.html { render action: 'new' }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])
    @quiz.num_choices = params[:num_choices]
    date = params[:deadline_date]
    deadline = "#{date[3,2]}/#{date[0,2]}/#{date[6,4]}"
    @quiz.deadline_date = deadline
    @quiz.deadline_time = params[:deadline_time]
    if params.has_key?(:group_code)
      @quiz.groups.clear
      params[:group_code].each do |code|
        @quiz.groups << Group.where(:code => code)
      end
    else
      @quiz.errors[:base] << "Must select at least one group"
      render action: 'edit'
      return
    end
    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    Question.where(:quiz_id => params[:id]).each do |question|
      question.choices.each{|choice| choice.destroy}
      question.destroy
    end
    Answer.where(:quiz_id => params[:id]).each{|answer| answer.destroy}
    Result.where(:quiz_id => params[:id]).each{|result| result.destroy}
    GroupQuiz.where(:quiz_id => params[:id]).each{|relation| relation.destroy}
    StudentQuiz.where(:quiz_id => params[:id]).each{|relation| relation.destroy}

    respond_to do |format|
      format.html { redirect_to dashboard_user_path }
      format.json { head :no_content }
    end
  end

  def take
    @quiz = Quiz.find(params[:id])
  end

  def answers

    @quiz = Quiz.find(params[:id].to_i)
    @user = current_user

    @student_quiz = current_user.student_quizzes.where(:quiz_id => @quiz.id).first
    @student_quiz.quiz_status = "completed"
    @student_quiz.save

    if !params[:choiceset].nil?
      params[:choiceset].each_pair do |question_id, choice_id|
        answer = @user.answers.find_or_create_by_question_id(:quiz_id => @quiz.id, :choice_id => choice_id, :question_id => question_id)
      end
    end
    if @user.answers.where(:quiz_id => @quiz.id).count != @quiz.questions.count

      questions_answered = @user.answers.where(:quiz_id => @quiz.id).collect{|answer| answer.question}
      questions_not_answered = @quiz.questions - questions_answered
      questions_not_answered.each do |question|
        @user.answers.create(:quiz_id => @quiz.id, :choice_id => 0, :question_id => question.id)
      end
    end
    redirect_to score_quiz_path(@quiz) and return
  end

  def score

    @quiz = Quiz.find(params[:id])

    if can? :update, @quiz
      if params[:user_id]
        @user = User.find(params[:user_id])
      else
        @user = current_user
      end
    else
      @user = current_user
    end
    @score = @user.score(@quiz)
  end

  def set_status
    @quiz = Quiz.find(params[:id])
    if current_user.role?(:instructor)
      @quiz.status = params[:status]
      @quiz.users.each do |user|
        @student_quiz = user.student_quizzes.where(:quiz_id => @quiz.id).first
        @student_quiz.quiz_status = params[:status]
        @student_quiz.save
      end
      @quiz.save
      if params[:status] == "active"
        # @quiz.take_email   ###
        redirect_to results_quiz_path(@quiz) and return
      elsif params[:status] == "completed"
        redirect_to overview_quiz_path(@quiz) and return
      end
      redirect_to dashboard_user_path(current_user) and return
    elsif current_user.role?(:student)
      format.html { redirect_to dashboard_user_path(current_user), notice: 'You do not have the privileges to change the status of this quiz.' }
    end
  end

  def results
    @quiz = Quiz.find(params[:id])
    @questions = Question.where(:quiz_id => @quiz.id)
  end

  def chart
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def overview
    @quiz = Quiz.find(params[:id])
  end

  def questions_submitted
    @quiz = Quiz.find(params[:id])
  end

  def notify_students
    @quiz = Quiz.find(params[:id])
    @quiz.questions_email
    redirect_to :back, notice: 'Group members have been notified.'
  end

end

