class Gauchada < ActiveRecord::Base
	has_many :questions
	default_scope -> {order ("created_at DESC")}
end
