class TipodocumentosController < ApplicationController
  before_action :set_tipodocumento, only: [:show, :edit, :update, :destroy]

  # GET /tipodocumentos
  # GET /tipodocumentos.json
  def index
    @tipodocumentos = Tipodocumento.all
  end

  # GET /tipodocumentos/1
  # GET /tipodocumentos/1.json
  def show
  end

  # GET /tipodocumentos/new
  def new
    @tipodocumento = Tipodocumento.new
  end

  # GET /tipodocumentos/1/edit
  def edit
  end

  # POST /tipodocumentos
  # POST /tipodocumentos.json
  def create
    if usuario_actual
      Auditorium.create(mensaje:usuario_actual.nombre+" con id "+usuario_actual.id.to_s+" creó un nuevo tipo de documento")
    end
    @tipodocumento = Tipodocumento.new(tipodocumento_params)

    respond_to do |format|
      if @tipodocumento.save
        format.html { redirect_to @tipodocumento, notice: 'Tipodocumento was successfully created.' }
        format.json { render :show, status: :created, location: @tipodocumento }
      else
        format.html { render :new }
        format.json { render json: @tipodocumento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipodocumentos/1
  # PATCH/PUT /tipodocumentos/1.json
  def update
    if usuario_actual
      Auditorium.create(mensaje:usuario_actual.nombre+" con id "+usuario_actual.id.to_s+" actualizó un tipo de documento")
    end
    respond_to do |format|
      if @tipodocumento.update(tipodocumento_params)
        format.html { redirect_to @tipodocumento, notice: 'Tipodocumento was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipodocumento }
      else
        format.html { render :edit }
        format.json { render json: @tipodocumento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipodocumentos/1
  # DELETE /tipodocumentos/1.json
  def destroy
    if usuario_actual
      Auditorium.create(mensaje:usuario_actual.nombre+" con id "+usuario_actual.id.to_s+" eliminó un tipo de documento")
    end
    @tipodocumento.destroy
    respond_to do |format|
      format.html { redirect_to tipodocumentos_url, notice: 'Tipodocumento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipodocumento
      @tipodocumento = Tipodocumento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipodocumento_params
      params.require(:tipodocumento).permit(:descripcion)
    end
end
