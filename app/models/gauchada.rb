class Gauchada < ActiveRecord::Base
	belongs_to :usuario
	has_many :questions
	validates :titulo, :descripcion, :ciudad, presence: true
	default_scope -> {order ("created_at DESC")}
end
