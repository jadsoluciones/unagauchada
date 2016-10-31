class GauchadasController < ApplicationController
  load_and_authorize_resource param_method: :gauchada_params
  before_action :set_gauchada, only: [:show, :edit, :update, :destroy]
  #default_scope -> {order :fecha}


  # GET /gauchadas
  # GET /gauchadas.json
  def index
    @gauchadas = Gauchada.all
  end

  # GET /gauchadas/1
  # GET /gauchadas/1.json
  def show
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

    respond_to do |format|
      if @gauchada.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gauchada
      @gauchada = Gauchada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gauchada_params
      params.require(:gauchada).permit(:titulo, :descripcion, :imagen, :ciudad)
    end
end
