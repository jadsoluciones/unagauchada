class Answer < ActiveRecord::Base
	belongs_to :question
	validates :contenido, presence: true
end
