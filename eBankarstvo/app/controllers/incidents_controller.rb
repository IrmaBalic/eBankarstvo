class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  # GET /incidents
  # GET /incidents.json
  def index
     begin
        if params[:status]
          @incidents = Incident.where("status = ?", params[:status])
        else
          @incidents = Incident.all
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
    #@priority = Priority.find_by(name: params[:priority])
    @incident = Incident.new(incident_params)
    @incident.category = @category
    #@incident.priority = @priority
    @incident.status = "Active"
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
    if params[:known_incident] != "-1"
      @known_incident = Incident.find_by_id(params[:known_incident])
      @incident.name = @known_incident.name
      @incident.description = @known_incident.description
      @incident.priority = @known_incident.priority
      @incident.category = @known_incident.category
    else
      @category = Category.find_by_id(params[:category])
      @priority = Priority.find_by(name: params[:priority])
      @incident.category = @category
      @incident.priority = @priority
      @incident.name = params[:incident][:name]
      @incident.description = params[:incident][:description] 
    end
    @incident.status = "Closed"
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
