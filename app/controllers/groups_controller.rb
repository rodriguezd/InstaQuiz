class GroupsController < ApplicationController
  load_and_authorize_resource
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  def create
    @group = Group.new(:name => params[:name], :instructor => current_user.id, :code => generate_code)
    if current_user.role?(:instructor)
      @groups = Group.where(:instructor => current_user.id)
    elsif current_user.role?(:student)
      @groups = current_user.groups
    end
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { redirect_to groups_path, notice: 'Group name must be entered.' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  def index
    if current_user.role?(:instructor)
      @groups = Group.where(:instructor => current_user.id)
    elsif current_user.role?(:student)
      @groups = current_user.groups
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(:name => params[:group][:name])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def join
    @user = current_user
    if @user.groups.where(:code => params[:group_code]).empty?
      @user.groups << Group.where(:code => params[:group_code])
      @user.save
      flash[:notice] = 'Successfully joined group.'
    else
      flash[:notice] = 'Already a member of group entered.'
    end
    redirect_to groups_path

    # if @user.save
    #     format.html { redirect_to groups_path, notice: 'Successfully joind group.' }
    #     format.json { render json: groups_path, status: :created, location: groups_url }
    #   else
    #     format.html { redirect_to groups_path, notice: 'Group code must be entered.' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
  end

  def grade
    @group = Group.find(params[:id])
  end

  def list_members
    @group = Group.find(params[:id])

  end

  def chart
    @group = Group.find(params[:id])
  end

  def leave
    GroupUser.where(:user_id => current_user.id, :group_id => params[:id]).pop.destroy
    redirect_to :action => :index
  end

  def remove_student
    GroupUser.where(:user_id => params[:student_id], :group_id => params[:id]).pop.destroy
    redirect_to list_members_path(params[:id])
  end

  private

  #generate random alphanumeric code for a new group
  def generate_code
    (0..5).map{rand(36).to_s(36)}.join
  end

end
