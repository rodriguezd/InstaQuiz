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
    @quiz.save
    @users = User.all
    @users.each{|user| user.student_quizzes.create(:quiz_id => @quiz.id, :quiz_status => "pending")}

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render json: @quiz, status: :created, location: @quiz }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])

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

    respond_to do |format|
      format.html { redirect_to quizzes_url }
      format.json { head :no_content }
    end
  end

  def take
    @quiz = Quiz.find(params[:id])
    @student_quiz = current_user.student_quizzes.where(:quiz_id => @quiz.id).first
    @student_quiz.quiz_status = "completed"
    @student_quiz.save
  end

  def answers
    # <input type="radio" name="question[1]choices[1][]" value="1">
    @quiz = Quiz.find(params[:id].to_i)
    @user = current_user
    params[:question].each_pair do |question_num, choice_hash|
      # question_id = num
      choice_id = choice_hash[:choice].keys.first.to_i
      answer = @user.answers.find_or_create_by_question_id(:quiz_id => @quiz.id, :choice_id => choice_id, :question_id => question_num)
    @quiz.status = "completed"
    @quiz.save
    redirect_to dashboard_user_path(current_user) and return

    end

    # # find quiz referred to
    # iterate through params
    # find question referred to
    # find choice that answer refers to
    # create an answer that has the user id, quiz id, choice id
  end

  def score
    @quiz = Quiz.find(params[:id])
    # @user = User.find(params[:id])
  end

  def set_status
    # raise params.inspect
    @quiz = Quiz.find(params[:id])
    if current_user.role?(:instructor)
      @quiz.status = params[:status]
      @quiz.users.each do |user|
        @student_quiz = user.student_quizzes.where(:quiz_id => @quiz.id).first
        @student_quiz.quiz_status = params[:status]
        @student_quiz.save
      end
      @quiz.save
    elsif current_user.role?(:student)
      format.html { redirect_to dashboard_user_path(current_user), notice: 'You do not have the privileges to change the status of this quiz.' }
    end
    redirect_to dashboard_user_path(current_user)
  end

end

