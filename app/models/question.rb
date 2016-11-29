class Question < ActiveRecord::Base
	belongs_to :gauchada
	belongs_to :usuario
	has_one :answer, dependent: :destroy
	validates :contenido, presence: true
	validates :usuario, presence: true
	validates :gauchada, presence: true
end
