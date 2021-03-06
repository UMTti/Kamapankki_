class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  def join 
    @group = Group.find(params[:id])
    @group.users << current_user
    #render :nothing => true
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'You joined to the group!' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :show }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  def groupmessage 
    @group = Group.find(params[:id])
    @message = Message.new
    @message.group = @group
    @message.sender_id = current_user.id
    @message.save
    @group.messages << @message
    #render 'app/views/messages/form'
    render :partial => 'messages/form', :formats => :html
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.users << current_user

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :user_id, :description, :message_id, :sender_id)
    end
end
