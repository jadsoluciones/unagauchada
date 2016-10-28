class Answer < ActiveRecord::Base
	belongs_to :question, dependent: :destroy
	#belongs_to :usuario
end
