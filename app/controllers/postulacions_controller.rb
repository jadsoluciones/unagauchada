class PostulacionsController < ApplicationController
  before_action :authenticate_usuario!, only: [:new]
  load_and_authorize_resource param_method: :postulacion_params
  before_action :set_postulacion, only: [:show, :edit, :update, :destroy, :cambiar_estado]

  # GET /postulacions
  # GET /postulacions.json
  def index
    @postulacions = Postulacion.all
  end

  # GET /postulacions/1
  # GET /postulacions/1.json
  def show
  end

  # GET /postulacions/new
  def new
    @gauchada_id = params[:gauchada_id]
    @postulacion = Postulacion.new
  end

  # GET /postulacions/1/edit
  def edit
  end

  # POST /postulacions
  # POST /postulacions.json
  def create
    @postulacion = Postulacion.new(postulacion_params)
    @postulacion.usuario = current_usuario

    respond_to do |format|
      if @postulacion.save
        format.html { redirect_to @postulacion, notice: 'La postulación se creó con éxito.' }
        format.json { render :show, status: :created, location: @postulacion }
      else
        format.html { render :new }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulacions/1
  # PATCH/PUT /postulacions/1.json
  def update
    respond_to do |format|
      if @postulacion.update(postulacion_params)
        format.html { redirect_to @postulacion, notice: 'La postulación se editó con éxito.' }
        format.json { render :show, status: :ok, location: @postulacion }
      else
        format.html { render :edit }
        format.json { render json: @postulacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulacions/1
  # DELETE /postulacions/1.json
  def destroy
    @postulacion.destroy
    respond_to do |format|
      format.html { redirect_to postulacions_url, notice: 'La postulación se borró con éxito.' }
      format.json { head :no_content }
    end
  end

  def cambiar_estado
    byebug
      if (params[:ok])
        @postulacion.estado = 'Aceptado'
      elsif (params[:ok])
        @postulacion.estado = 'Rechazado'
      end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulacion
      @postulacion = Postulacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulacion_params
      params.require(:postulacion).permit(:descripcion, :fecha, :estado, :gauchada_id)
    end
end
