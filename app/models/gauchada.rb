class Gauchada < ActiveRecord::Base
	has_many :preguntas
	has_many :respuestas

	#default_scope -> {order :fecha}
end
