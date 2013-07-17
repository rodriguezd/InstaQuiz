class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    # @questions = @quiz.questions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    # raise params.inspect
    @question = Question.new
    @quiz = Quiz.find(params[:quiz_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(:content => params[:question][:content], :quiz_id => params[:quiz_id])
    @question.save

    params[:choices].each_with_index do |choice, i|
      choice = @question.choices.build(:content => choice, :question_id => @question.id)
      if i == params[:correct].to_i
        choice.correct = true
      end
      choice.save

    end

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question} #notice: 'Question was successfully created.' }
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
    # raise params.inspect
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(:content => params[:question][:content])
        # debugger
        @question.choices.each_with_index do |c, i|
          c.update_attributes(:content => params[:choices][i])
        if i == params[:correct].to_i
          c.correct = true
        else
          c.correct = false
        end
        c.save
          # c.content = params[:choices][i]
          # c.save
        end
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
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
    # raise params.inspect
    # "status"=>{"1"=>"approved", "3"=>"approved"}
    approved_ids = params[:status].keys.collect {|i| i.to_i}

    questions = Quiz.find(params[:quiz_id]).questions
    questions.each do |q|
      if approved_ids.include?(q.id)
        q.status = "approved"

      else 
        q.status = "pending"
      end
      q.save
    end
    redirect_to quiz_path(params[:quiz_id])
  end
end
