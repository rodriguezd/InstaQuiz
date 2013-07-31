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
    @group = Group.new(:name => params[:group][:name], :instructor => current_user.id, :code => generate_code)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    raise params.inspect
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
    # @groups = Group.all
    if current_user.role?(:instructor)
      @groups = Group.where(:instructor => current_user.id)
    else
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
    @user.groups << Group.where(:code => params[:group_code])
    @user.save
    redirect_to groups_url

    # if @user.save
    #     format.html { redirect_to groups_url, notice: 'Successfully joind group.' }
    #     format.json { render json: groups_url, status: :created, location: groups_url }
    #   else
    #     format.html { render action: "index" }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
  end

  private

  #generate random alphanumeric code for a new group
  def generate_code
    (0..5).map{rand(36).to_s(36)}.join
  end

  def grade
    @group = Group.find(params[:id])
  end

  def chart
    @group = Group.find(params[:id])
  end

end
