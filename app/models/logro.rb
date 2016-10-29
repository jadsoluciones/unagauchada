class Logro < ActiveRecord::Base
	validates :titulo, :puntaje, presence:true, uniqueness:true
	validates :puntaje, numericality: true

	before_destroy :check_for_unico

	private

	def check_for_unico   
	  unless Logro.all.count > 1     
	    self.errors[:base] << "Debe haber al menos un logro"
	    return false   
	  end 
	end 
end
