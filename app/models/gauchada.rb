class Gauchada < ActiveRecord::Base
	belongs_to :usuario
	has_many :questions
	validates :titulo, :descripcion, :ciudad, presence: true
	default_scope -> {order ("created_at DESC")}



	def self.cantidad_resultados(options = {})
		return self.filter(options).size()
	end

	def self.resultados(options = {})
		options = options || {}
		options.reverse_merge!(
				:pagina => 1
		)
		return self.filter(options).limit(20).offset((options[:pagina].to_i-1)*20)
	end

	private

	def self.filter(options = {})
		 options.reverse_merge!(
		 	:ciudad => nil,
		 	:frase => nil
		 )
		 puts options.inspect	
		 if !options[:frase] && !options[:ciudad] then ## no hay frase ni cuidad
		   return Gauchada.all 
		 elsif !options[:frase] && options[:ciudad] # no hay frase pero hay ciudad
		   return Gauchada.where("ciudad = ?",options[:ciudad])
		 elsif options[:frase] && !options[:ciudad] # hay frase pero no hay ciudad
		   return Gauchada.where("
		             (titulo  ILIKE ? OR 
		             descripcion ILIKE  ? )",'%'+options[:frase].downcase+'%','%'+options[:frase].downcase+'%')
		 else # hay frase y hay ciudad
		   return Gauchada.where("
		       (titulo ILIKE ? OR 
		       descripcion ILIKE ? ) AND
		       ciudad = ?",'%'+options[:frase].downcase+'%','%'+options[:frase].downcase+'%',options[:ciudad])
		 end	
	end
end
