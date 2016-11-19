module ApplicationHelper
	def img_exts
		allowed = ['.GIF','.PNG','.JPG','.BMP']
		allowed = allowed.concat allowed.map(&:downcase)
		allowed.join ','
	end
end
