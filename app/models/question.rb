class Question < ActiveRecord::Base
	belongs_to :gauchada, dependent: :destroy
	belongs_to :usuario, dependent: :destroy
	has_one :answer
end
