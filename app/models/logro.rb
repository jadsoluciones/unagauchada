class Logro < ActiveRecord::Base
	validates :titulo, :min,:max, presence:true, uniqueness: {case_sensitive: false}
	validates :min,:max, numericality: true

	before_destroy :check_for_unico
	
	before_save :check_for_rango_valido
	before_create :check_for_solapa_create
	before_update :check_for_solapa_update

	private

	def check_for_unico
	  unless Logro.all.size > 1
	  #unless puntaje != -2147483648
	    self.errors[:base] << "Debe haber al menos un logro"
	    return false
	  end
	end
	
	def check_for_rango_valido
	  if min > max
	    self.errors[:base] << "El máximo no puede ser mayor que el mínimo"
	    return false
	  end
	end
	
	def check_for_solapa_create
	  res = Logro.where("(titulo<>?)				AND
	   			((min <= ? AND max >= ?) OR 
	   			 (min <= ? AND max >= ?) OR 
	   			 (min >= ? AND max <= ?))",titulo,min,min,max,max,min,max)
	  if res.size>0
	    self.errors[:base] << "Este puntaje solapa con: "+res.pluck(:titulo).join(", ")
	    return false
	  end
	end
	
	def check_for_solapa_update
	  res = Logro.where("(id<>?)				AND
	   			((min <= ? AND max >= ?) OR 
	   			 (min <= ? AND max >= ?) OR 
	   			 (min >= ? AND max <= ?))",id,min,min,max,max,min,max)
	  if res.size>0
	    self.errors[:base] << "Este puntaje solapa con: "+res.pluck(:titulo).join(", ")
	    return false
	  end
	end
end
