class Compra < ActiveRecord::Base
	@tajerta

	validates :puntos_comprados, presence:true

	before_save :check_for_valido

	attr_accessor :tarjeta


	private 

	def check_for_valido
		if self.puntos_comprados <= 0 then
			self.errors[:base] << "Debe comprar al menos un punto"
			return false
		end
	end
end
