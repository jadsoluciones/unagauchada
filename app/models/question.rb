class Question < ActiveRecord::Base
	belongs_to :gauchada, dependent: :destroy
	#belongs_to :usuario
	has_one :answer
end
