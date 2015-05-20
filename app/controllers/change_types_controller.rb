class ChangeTypesController < ApplicationController
  before_action :set_change_type, only: [:show, :edit, :update, :destroy]

  # GET /change_types
  # GET /change_types.json
  def index
    @change_types = ChangeType.all
  end

  # GET /change_types/1
  # GET /change_types/1.json
  def show
  end

  # GET /change_types/new
  def new
    @change_type = ChangeType.new
  end

  # GET /change_types/1/edit
  def edit
  end

  # POST /change_types
  # POST /change_types.json
  def create
    @change_type = ChangeType.new(change_type_params)

    respond_to do |format|
      if @change_type.save
        format.html { redirect_to @change_type, notice: 'Change type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @change_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @change_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /change_types/1
  # PATCH/PUT /change_types/1.json
  def update
    respond_to do |format|
      if @change_type.update(change_type_params)
        format.html { redirect_to @change_type, notice: 'Change type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @change_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_types/1
  # DELETE /change_types/1.json
  def destroy
    @change_type.destroy
    respond_to do |format|
      format.html { redirect_to change_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_type
      @change_type = ChangeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def change_type_params
      params[:change_type]
    end
end
