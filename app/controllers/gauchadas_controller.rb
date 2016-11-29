class GauchadasController < ApplicationController
  before_action :authenticate_usuario!, only: [:new]
  load_and_authorize_resource param_method: :gauchada_params
  before_action :set_gauchada, only: [:show, :edit, :update, :destroy]



  # GET /gauchadas
  # GET /gauchadas.json
  def index

    @gauchadas = Gauchada.resultados params

    @paginacion = {:total => Gauchada.cantidad_paginas(params),:current => params[:pagina].to_i || 1}
    #@gauchadas = Gauchada.all
  end

  # GET /gauchadas/1
  # GET /gauchadas/1.json
  def show
    if current_usuario
      @new_quest = Question.new usuario_id:current_usuario.id
    end
  end

  # GET /gauchadas/new
  def new
    @gauchada = Gauchada.new
  end

  # GET /gauchadas/1/edit
  def edit
  end

  # POST /gauchadas
  # POST /gauchadas.json
  def create
    @gauchada = Gauchada.new(gauchada_params)
    @gauchada.usuario = current_usuario
    upload_image_to_cloudinary(params[:gauchada][:image])

    respond_to do |format|
      if @gauchada.save
        usuario = Usuario.find(current_usuario.id)
        usuario.puntos -= 1
        usuario.save
        format.html { redirect_to @gauchada, notice: 'Gauchada creada.' }
        format.json { render :show, status: :created, location: @gauchada }
      else
        format.html { render :new }
        format.json { render json: @gauchada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gauchadas/1
  # PATCH/PUT /gauchadas/1.json
  def update
    upload_image_to_cloudinary(params[:gauchada][:image])
    respond_to do |format|
      if @gauchada.update(gauchada_params)
        format.html { redirect_to @gauchada, notice: 'Gauchada actualizada.' }
        format.json { render :show, status: :ok, location: @gauchada }
      else
        format.html { render :edit }
        format.json { render json: @gauchada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gauchadas/1
  # DELETE /gauchadas/1.json
  def destroy
    @gauchada.destroy
    respond_to do |format|
      format.html { redirect_to gauchadas_url, notice: 'Gauchada eliminada.' }
      format.json { head :no_content }
    end
  end

  def ver_listado
    if(@gauchada.id != 0)then
      @postulados = Gauchada.find(@gauchada.id).postulacions.all
    else
      redirect_to :back
    end
  end

  def terminar
    if(@gauchada.id != 0)then
      @postulados = Gauchada.find(@gauchada.id).postulacions.all
      @postulados.each do |pos|
        if pos.estado == 'Aceptado'
          @postulante = pos
        end
      end
    else
      redirect_to :back
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gauchada
      @gauchada = Gauchada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gauchada_params
      params.require(:gauchada).permit(:titulo, :descripcion, :image_url, :ciudad)
    end

    def upload_image_to_cloudinary(image)
      return if image.nil?
      hash = Cloudinary::Uploader.upload(image)
      @gauchada.cloudinary_id = hash["public_id"]
      @gauchada.image_url     = hash["secure_url"]
    end

end
