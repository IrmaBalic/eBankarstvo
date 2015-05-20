class CTypesController < ApplicationController
  before_action :set_c_type, only: [:show, :edit, :update, :destroy]

  # GET /c_types
  # GET /c_types.json
  def index
    @c_types = CType.all
  end

  # GET /c_types/1
  # GET /c_types/1.json
  def show
  end

  # GET /c_types/new
  def new
    @c_type = CType.new
  end

  # GET /c_types/1/edit
  def edit
  end

  # POST /c_types
  # POST /c_types.json
  def create
    @c_type = CType.new(c_type_params)

    respond_to do |format|
      if @c_type.save
        format.html { redirect_to @c_type, notice: 'C type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @c_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @c_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /c_types/1
  # PATCH/PUT /c_types/1.json
  def update
    respond_to do |format|
      if @c_type.update(c_type_params)
        format.html { redirect_to @c_type, notice: 'C type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @c_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /c_types/1
  # DELETE /c_types/1.json
  def destroy
    @c_type.destroy
    respond_to do |format|
      format.html { redirect_to c_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_type
      @c_type = CType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_type_params
      params.require(:c_type).permit(:name)
    end
end
