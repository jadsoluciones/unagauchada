class Question < ActiveRecord::Base
	belongs_to :gauchada
	belongs_to :usuario
	has_one :answer
end
