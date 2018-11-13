class DependenciaController < ApplicationController
  before_action :set_dependencium, only: [:show, :edit, :update, :destroy]

  # GET /dependencia
  # GET /dependencia.json
  def index
    @dependencia = Dependencium.all
  end

  # GET /dependencia/1
  # GET /dependencia/1.json
  def show
  end

  # GET /dependencia/new
  def new
    @dependencium = Dependencium.new
  end

  # GET /dependencia/1/edit
  def edit
  end

  # POST /dependencia
  # POST /dependencia.json
  def create
    @dependencium = Dependencium.new(dependencium_params)

    respond_to do |format|
      if @dependencium.save
        format.html { redirect_to @dependencium, notice: 'Dependencium was successfully created.' }
        format.json { render :show, status: :created, location: @dependencium }
      else
        format.html { render :new }
        format.json { render json: @dependencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dependencia/1
  # PATCH/PUT /dependencia/1.json
  def update
    respond_to do |format|
      if @dependencium.update(dependencium_params)
        format.html { redirect_to @dependencium, notice: 'Dependencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @dependencium }
      else
        format.html { render :edit }
        format.json { render json: @dependencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dependencia/1
  # DELETE /dependencia/1.json
  def destroy
    @dependencium.destroy
    respond_to do |format|
      format.html { redirect_to dependencia_url, notice: 'Dependencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dependencium
      @dependencium = Dependencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dependencium_params
      params.require(:dependencium).permit(:descripcion)
    end
end
