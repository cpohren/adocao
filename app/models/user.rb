class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable, 
  :omniauth_providers => [:facebook]
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #user.email = auth.info.email
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.first_name   # assuming the user model has a name
      user.surname = auth.info.last_name
      user.link = auth.extra.raw_info.link
      user.image = auth.info.image
      user.birthday = auth.extra.raw_info.birthday
      #user.image = auth.info.image # assuming the user model has an image
    end
  end
  has_many :animals  
end
