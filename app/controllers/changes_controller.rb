class ChangesController < ApplicationController
  before_action :set_change, only: [:show, :edit, :update, :destroy]

  # GET /changes
  # GET /changes.json
  def index
    begin
      if session[:role] == "EmergencyAB"
        @changes = Change.where("c_type_id = ?", "2").order('created_at DESC')
      elsif session[:role] == "BigAB"
        @changes = Change.where("c_type_id = ?", "1").order('created_at DESC')
      elsif session[:role] == "StandardAB"
        @changes = Change.where("c_type_id = ?", "3").order('created_at DESC')
      else
        if params[:status]
          @changes = Change.where("status = ?", params[:status]).order('created_at DESC')
        else
          @changes = Change.order('created_at DESC')
        end        
      end
    end
  end

  # GET /changes/1
  # GET /changes/1.json
  def show
  end

  # GET /changes/new
  def new
    @change = Change.new
  end

  # GET /changes/1/edit
  def edit
    if @change.category
      @category = @change.category.id
    end
    if @change.c_type
      @ctype = @change.c_type.id
    end
    if @change.priority
      @priority = @change.priority.id
    end
  end

  # POST /changes
  # POST /changes.json
  def create
    @change = Change.new(change_params)
    @user = User.find(session[:user_id])
    @change.status = "Active"
    @change.user = @user
    respond_to do |format|
      if @change.save
        format.html { redirect_to @change, notice: 'Change was successfully created.' }
        format.json { render action: 'show', status: :created, location: @change }
      else
        format.html { render action: 'new' }
        format.json { render json: @change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /changes/1
  # PATCH/PUT /changes/1.json
  def update

    @category = Category.find_by_id(params[:category])
    @type = CType.find_by_id(params[:c_type])
    @priority = Priority.find_by(name: params[:priority])
    @change.category = @category
    @change.c_type = @type
    @change.priority = @priority
    @change.name = params[:change][:name]
    @change.description = params[:change][:description]

    respond_to do |format|
      if @change.update(change_params)
        format.html { redirect_to @change, notice: 'Change was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @change.errors, status: :unprocessable_entity }
      end
    end
  end
  def solve
    #Waiting to confirm closing
    @change = Change.find(params[:id])
    @change.status = "Active"
    @change.confirmed = "Waiting"
    @change.comment = params[:change][:comment]
    @change.save
    redirect_to @change
  end
  def solve_form
    @change = Change.find(params[:id])
  end
  def confirm
    @change = Change.find(params[:id])
    @change.confirmed = "Yes"
    @change.status = "Closed"
    @change.save
    user = User.find(session[:user_id])
    redirect_to user_url(user)
  end
  def decline
    @change = Change.find(params[:id])
    @change.confirmed = "No"
    @change.status = "Active"
    @change.save
    user = User.find(session[:user_id])
    redirect_to user_url(user)
  end
  # DELETE /changes/1
  # DELETE /changes/1.json
  def destroy
    @change.destroy
    respond_to do |format|
      format.html { redirect_to changes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change
      @change = Change.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def change_params
      params.require(:change).permit(:name, :description, :category_id, :priority_id, :user_id, :status, :confirmed, :comment, :c_type_id)
    end
end
