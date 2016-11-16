class HomeController < ApplicationController
	def index
		@gauchadas = Gauchada.all

		render :template =>'gauchadas/index'
	end

	


end
