class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  rolify

  class << self
    def from_omniauth(omniauth)
      where(
        provider: omniauth.provider,
        uid: omniauth.uid
      ).first_or_create do |r|
        r.email = omniauth.info.email || "#{Devise.friendly_token[0, 20]}@#{omniauth.provider}.com"
        r.password = Devise.friendly_token[0, 20]
        # Don't need to check email
        r.skip_confirmation!
      end
    end
  end
end
