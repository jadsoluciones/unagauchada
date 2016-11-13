class HomeController < ApplicationController
	def index
		@gauchadas = Gauchada.all
	end
end
