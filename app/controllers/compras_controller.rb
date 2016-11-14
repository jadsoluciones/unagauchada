class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :destroy]

  # GET /compras
  # GET /compras.json 
  require 'credit_card_validations/string'


  def index
    @compras = Compra.all
  end

  # GET /compras/1
  # GET /compras/1.json
  def show

  end

  # GET /compras/new
  def new
    # remplazar 12 por configuracion

    @precio = 12
    @compra = Compra.new
  end


  # GET /compras/1/edit
  def edit
  end

  # POST /compras
  # POST /compras.json
  def create
    # remplazar 12 por configuracion

    precio = 12

    puntos = compra_params[:puntos_comprados]

    monto = precio * puntos.to_i
    @compra = Compra.new monto: monto, puntos_comprados:puntos

    respond_to do |format|
      if valid_card? && @compra.save
        format.html { redirect_to @compra, notice: "Usted compró #{@compra.puntos_comprados} puntos por un total de $ARS #{@compra.monto}." }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update

  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: 'Compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:puntos_comprados,:tarjeta)
    end

    def valid_card?
      num = compra_params[:tarjeta] || ''
      unless num.valid_credit_card_brand?
        @compra.errors[:base] << "La tarjeta no es valida"
        return false
      end
      return true
    end
end
