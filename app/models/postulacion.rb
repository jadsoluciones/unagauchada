class Postulacion < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :gauchada
end
