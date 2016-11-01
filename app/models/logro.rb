class Logro < ActiveRecord::Base
	validates :titulo, :puntaje, presence:true, uniqueness: {case_sensitive: false}
	validates :puntaje, numericality: true

	before_destroy :check_for_unico

	private

	def check_for_unico   
	  unless puntaje != -2147483648     
	    self.errors[:base] << "Debe haber al menos un logro"
	    return false   
	  end 
	end 
end
