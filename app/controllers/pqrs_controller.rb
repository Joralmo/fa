class PqrsController < ApplicationController
  before_action :set_pqr, only: [:show, :edit, :update, :destroy]

  # GET /pqrs
  # GET /pqrs.json
  def index
    if usuario_actual
      if usuario_actual.dependencium.descripcion == "usuarioNormal"
        @pqrs = Pqr.where(usuario: usuario_actual.id)
      elsif usuario_actual.rol.descripcion == "s_admin"
        @pqrs = Pqr.all
      else
        @pqrs = Pqr.where(dependencium: usuario_actual.dependencium)
      end
    else
      redirect_to root_url, notice: "Debes loguearte!"
    end
  end

  # GET /pqrs/1
  # GET /pqrs/1.json
  def show
  end

  # GET /pqrs/new
  def new
    if usuario_actual
      @pqr = Pqr.new
    else
      redirect_to root_url, notice: "Debes loguearte!"
    end
  end

  # GET /pqrs/1/edit
  def edit
  end

  # POST /pqrs
  # POST /pqrs.json
  def create
    if usuario_actual
      Auditorium.create(mensaje:usuario_actual.nombre+" con id "+usuario_actual.id.to_s+" creó un nuevo pqr")
    end
    @pqr = Pqr.new(pqr_params)

    @pqr.estado = false
    @pqr.dependencium = Dependencium.find_by(descripcion: "Director")
    @pqr.actual = "s_admin"

    name = pqr_params["archivo"].original_filename
    path = File.join("public", "archivos", "upload", name)
    File.open(path, "wb") { |f| f.write( pqr_params["archivo"].read ) }

    @pqr.archivo = "archivos/upload/"+name

    respond_to do |format|
      if @pqr.save
       
        format.html { redirect_to @pqr, notice: 'Pqr enviado correctamente.' }
        format.json { render :show, status: :created, location: @pqr }
      else
        format.html { render :new }
        format.json { render json: @pqr.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /pqrs/1
  # PATCH/PUT /pqrs/1.json
  def update
    if usuario_actual
      Auditorium.create(mensaje:usuario_actual.nombre+" con id "+usuario_actual.id.to_s+" actualizó un pqr")
    end
     if params.require(:commit) == "Transferir"
      datos = {
        idPqr: params[:id],
        idNuevaDependencia: pqr_params[:dependencium_id]
      }
      redirect_to new_comentario_path(datos)
      #Rails.logger.debug datos[:idPqr]
      #Rails.logger.debug "Está en " + Pqr.find(params[:id]).dependencium.descripcion
      #Rails.logger.debug "Va para " + Dependencium.find(pqr_params[:dependencium_id]).descripcion
    else
      respond_to do |format|
        if @pqr.update(pqr_params)
          format.html { redirect_to @pqr, notice: 'Pqr was successfully updated.' }
          format.json { render :show, status: :ok, location: @pqr }
        else
          format.html { render :edit }
          format.json { render json: @pqr.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def respuesta
    if usuario_actual
      Auditorium.create(mensaje:usuario_actual.nombre+" con id "+usuario_actual.id.to_s+" respondió un pqr")
    end
    Rails.logger.debug "============================"
    Rails.logger.debug params[:idPqr]
    Rails.logger.debug "============================"
    Notification.create(idUsuario:Pqr.find(params[:idPqr][1]).usuario.id, mensaje:"Se le ha dado respuesta a uno de sus pqr", leida:false, pqr:params[:idPqr][1])
    @pqr = Pqr.find(params[:idPqr][1])
    if @pqr.update(respuesta: params[:respuesta])
      render :json => true
    end
    
  end

  # DELETE /pqrs/1
  # DELETE /pqrs/1.json
  def destroy
    if usuario_actual
      Auditorium.create(mensaje:usuario_actual.nombre+" con id "+usuario_actual.id.to_s+" eliminó un pqr")
    end
    @pqr.destroy
    respond_to do |format|
      format.html { redirect_to pqrs_url, notice: 'Pqr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pqr
      @pqr = Pqr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pqr_params
      params.require(:pqr).permit(:fecha, :descripcion, :archivo, :estado, :usuario_id, :dependencium_id, :respuesta)
    end
end
