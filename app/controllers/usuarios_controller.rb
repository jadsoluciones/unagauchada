class UsuariosController < ApplicationController

  def show
    @usuario = Usuario.find(params[:id])
    @puntaje = Logro.where("min <= ?", @usuario.puntos).order(min: :desc).first
  end

end
