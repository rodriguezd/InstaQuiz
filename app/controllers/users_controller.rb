class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.roles << Role.where(:name => params[:role])

    respond_to do |format|
      if @user.valid? && params.has_key?(:role)
        @user.save
        login(@user)
        format.html { redirect_to dashboard_user_path(@user) }
        format.json { render json: @user, status: :created, location: @user }
      else
        @user.errors[:base] << "Role must be selected." if !params.has_key?(:role)
        @user.errors.delete(:password_digest)
        format.html { render action: "new", notice: 'User was not created.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def dashboard

    @user = current_user
    @transparent = true
    if current_user.role?(:instructor)
      @active = Quiz.where(:status => "active", :instructor => current_user.id)
      @pending = Quiz.where(:status => "pending", :instructor => current_user.id)
      @completed = Quiz.where(:status => "completed", :instructor => current_user.id)
      @finalized = Quiz.where(:status => "finalized", :instructor => current_user.id)
    elsif current_user.role?(:student)
      @active = @user.quizzes.where(:student_quizzes => {:quiz_status => "active"})
      @pending = @user.quizzes.where(:student_quizzes => {:quiz_status => "pending"})
      @completed = @user.quizzes.where(:student_quizzes => {:quiz_status => "completed"})
      @question_submitted = @user.quizzes.where(:student_quizzes => {:quiz_status => "question_submitted"})
    end
  end

  def dashboard_status
    @user = current_user
    @status = params[:status]
    if current_user.role?(:instructor)
      @quizzes = Quiz.where(:status => @status, :instructor => current_user.id)
      # render 'active'
    elsif current_user.role?(:student)
      @quizzes = @user.quizzes.where(:student_quizzes => {:quiz_status => @status})
    end
    # redirect_to dashboard_path and return
  end

end
