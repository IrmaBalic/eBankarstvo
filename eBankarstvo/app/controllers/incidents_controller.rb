class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  # GET /incidents
  # GET /incidents.json
  def index
     begin
        if params[:status]
          @incidents = Incident.where("status = ?", params[:status]).order('created_at DESC')
        else
          @incidents = Incident.order('created_at DESC')
        end
      end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
  end

  # GET /incidents/1/edit
  def edit
    @category = @incident.category.id
    if @incident.priority
      @priority = @incident.priority.id
    end
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @category = Category.find_by_id(params[:category])
    @user = User.find(session[:user_id])

    @incident = Incident.new(incident_params)
    @incident.category = @category
    @incident.status = "Active"
    @incident.user = @user

    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render action: 'show', status: :created, location: @incident }
      else
        format.html { render action: 'new' }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
      @category = Category.find_by_id(params[:category])
      @priority = Priority.find_by(name: params[:priority])
      @incident.category = @category
      @incident.priority = @priority
      @incident.name = params[:incident][:name]
      @incident.description = params[:incident][:description] 
      respond_to do |format|
        if @incident.save
          format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @incident.errors, status: :unprocessable_entity }
        end
      end
  end
  def solve
    #Waiting to confirm closing
    @incident = Incident.find(params[:id])
    @incident.status = "Active"
    @incident.confirmed = "Waiting"
    if params[:known_incident] != "-1"
      @known_incident = Incident.find_by_id(params[:known_incident])
      @incident.solution = @known_incident.solution
    else
      @incident.solution = params[:incident][:solution]
    end
    @incident.save
    redirect_to @incident
  end
  def solve_form
    @incident = Incident.find(params[:id])
  end
  def confirm
    @incident = Incident.find(params[:id])
    @incident.confirmed = "Yes"
    @incident.status = "Closed"
    @incident.save
    user = User.find(session[:user_id])
    redirect_to user_url(user)
  end
  def decline
    @incident = Incident.find(params[:id])
    @incident.confirmed = "No"
    @incident.status = "Active"
    @incident.save
    user = User.find(session[:user_id])
    redirect_to user_url(user)
  end
  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:name, :description, :category_id, :priority_id, :status)
    end
end
