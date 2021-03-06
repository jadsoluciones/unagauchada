class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :gauchadas, dependent: :destroy
  has_many :postulacions
  validates :puntos, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




  def logro
  	return Logro.where("min <=?",self.puntos).order(:min => :desc).first
  end

  def imagen
    self.image_url || 'def-profile.png'
  end

end
