class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    if params[:quiz_id]
      @questions = Question.where(:quiz_id => params[:quiz_id])
    else
      @questions = Question.all
    end
    # @questions = @quiz.questions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    # raise params.inspect
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    # can the current user edit this quiz?
    @quiz = Quiz.find(params[:quiz_id])
    # return if !can_current_user? :edit, @quiz

    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    # raise params.inspect
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(:content => params[:question][:content], :quiz_id => params[:quiz_id], :user_id => current_user.id)
    if current_user.role?(:instructor)
      @question.status = 'approved'
    elsif current_user.role?(:student)
      @student_quiz = current_user.student_quizzes.where(:quiz_id => @question.quiz_id).first
      @student_quiz.quiz_status = "question_submitted"
      @student_quiz.save
    end
    @question.save
    @question.add_choices(params[:choices], params[:correct])

    respond_to do |format|
      if @question.save
        # format.html { redirect_to question_path(@question, :quiz_id => @question.quiz_id)} #notice: 'Question was successfully created.' }
        format.html { redirect_to quiz_question_path(params[:quiz_id], @question)}
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
    @question.update_attributes(:content => params[:question][:content])
    @question.update_choices(params[:choices], params[:correct])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @quiz, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def review
    @quiz = Quiz.find(params[:quiz_id])

  end

  def approve
    questions = Quiz.find(params[:quiz_id]).questions

    approved_ids = []
    unless params[:status].nil?
      approved_ids = params[:status].keys.collect {|i| i.to_i}
    end

    questions.each do |q|
      q.change_status(approved_ids)
    end
    redirect_to quiz_path(params[:quiz_id])
  end
end
