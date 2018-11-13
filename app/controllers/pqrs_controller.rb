class PqrsController < ApplicationController
  before_action :set_pqr, only: [:show, :edit, :update, :destroy]

  # GET /pqrs
  # GET /pqrs.json
  def index
    if usuario_actual
      @pqrs = Pqr.all
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

    @pqr = Pqr.new(pqr_params)

    @pqr.estado = false

    name = pqr_params["archivo"].original_filename
    path = File.join("public", "archivos", "upload", name)
    File.open(path, "wb") { |f| f.write( pqr_params["archivo"].read ) }

    @pqr.archivo = "archivos/upload/"+name

    respond_to do |format|
      if @pqr.save
       
        format.html { redirect_to @pqr, notice: 'Pqr was successfully created.' }
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

  # DELETE /pqrs/1
  # DELETE /pqrs/1.json
  def destroy
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
