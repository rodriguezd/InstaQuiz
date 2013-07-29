class GroupsController < ApplicationController
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
  end

  def destroy
  end

  def show
  end

  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  def update
  end

  private

  #generate random alphanumeric code for a new group
  def generate_code
    (0..5).map{rand(36).to_s(36)}.join
  end
end
