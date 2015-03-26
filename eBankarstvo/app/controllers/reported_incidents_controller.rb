class ReportedIncidentsController < ApplicationController
  before_action :set_reported_incident, only: [:show, :edit, :update, :destroy]

  # GET /reported_incidents
  # GET /reported_incidents.json
  def index
    @reported_incidents = ReportedIncident.all
  end

  # GET /reported_incidents/1
  # GET /reported_incidents/1.json
  def show
  end

  # GET /reported_incidents/new
  def new
    @reported_incident = ReportedIncident.new
  end

  # GET /reported_incidents/1/edit
  def edit
  end

  # POST /reported_incidents
  # POST /reported_incidents.json
  def create
    @reported_incident = ReportedIncident.new(reported_incident_params)

    respond_to do |format|
      if @reported_incident.save
        format.html { redirect_to @reported_incident, notice: 'Reported incident was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reported_incident }
      else
        format.html { render action: 'new' }
        format.json { render json: @reported_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reported_incidents/1
  # PATCH/PUT /reported_incidents/1.json
  def update
    respond_to do |format|
      if @reported_incident.update(reported_incident_params)
        format.html { redirect_to @reported_incident, notice: 'Reported incident was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reported_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reported_incidents/1
  # DELETE /reported_incidents/1.json
  def destroy
    @reported_incident.destroy
    respond_to do |format|
      format.html { redirect_to reported_incidents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reported_incident
      @reported_incident = ReportedIncident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reported_incident_params
      params.require(:reported_incident).permit(:name, :description, :category_id)
    end
end
