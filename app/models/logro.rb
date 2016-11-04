class Logro < ActiveRecord::Base
	validates :titulo, :min,:max, presence:true, uniqueness: {case_sensitive: false}
	validates :min,:max, numericality: true

	before_destroy :check_for_unico
	
	before_save :check_for_solapa

	def next
	  self.class.where("puntaje > ?", puntaje).order("puntaje ASC").first || Logro.new(titulo:'Inifinito',puntaje:'2147483648')
	end

	private

	def check_for_unico
	  unless Logro.all.size > 1
	  #unless puntaje != -2147483648
	    self.errors[:base] << "Debe haber al menos un logro"
	    return false
	  end
	end
	
	def check_for_solapa
	  res = Logro.where(" (min <= ? AND max >= ?) OR (min <= ? AND max >= ?) OR (min >= ? AND max <= ?)",min,min,max,max,min,max)
	  if res.size>0
	    self.errors[:base] << "Este puntaje solapa con: "+res.pluck(:titulo).join(", ")
	    return false
	  end
	end
end
