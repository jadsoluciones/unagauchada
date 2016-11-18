class Gauchada < ActiveRecord::Base
	belongs_to :usuario
	has_many :questions
	has_many :postulacions
	validates :titulo, :descripcion, :ciudad, presence: true
	default_scope -> {order ("created_at DESC")}

end
