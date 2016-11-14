class HomeController < ApplicationController
	def index
		@gauchadas = Gauchada.all

		render :template =>'gauchadas/index'
	end

	def search
		f_a = params[:frase] == '*'
		c_a = params[:ciudad] == '*'
		if f_a && c_a then ## no hay frase ni cuidad
			@gauchadas = Gauchada.all	
		elsif f_a && !c_a # no hay frase pero hay ciudad
			@gauchadas = Gauchada.where("ciudad = ?",params[:ciudad])
		elsif !f_a && c_a # hay frase pero no hay ciudad
			@gauchadas = Gauchada.where("
								(titulo  ILIKE ? OR 
								descripcion ILIKE  ? )",'%'+params[:frase].downcase+'%','%'+params[:frase].downcase+'%')
		else # hay frase y hay ciudad
			@gauchadas = Gauchada.where("
					(titulo ILIKE ? OR 
					descripcion ILIKE ? ) AND
					ciudad = ?",'%'+params[:frase].downcase+'%','%'+params[:frase].downcase+'%',params[:ciudad])
		end
		render :template => 'gauchadas/index'
	end


end
