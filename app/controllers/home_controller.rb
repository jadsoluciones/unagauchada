class HomeController < ApplicationController
	def index
		@gauchadas = Gauchada.all

		render :template =>'gauchadas/index'
	end

	def search 
		if params[:ciudad] then
			if params[:frase] == '*' then
				@gauchadas = Gauchada.where("ciudad = ?",params[:ciudad])
			else
				@gauchadas = Gauchada.where("
					(titulo LIKE ? OR 
					descripcion LIKE ?) AND
					ciudad = ?",'%'+params[:frase]+'%','%'+params[:frase]+'%',params[:ciudad])
			end
		else
			@gauchadas = Gauchada.where("
							(titulo LIKE ? OR 
							descripcion LIKE ?)",'%'+params[:frase]+'%','%'+params[:frase]+'%')
		end
		render :template => 'gauchadas/index'
	end


end
