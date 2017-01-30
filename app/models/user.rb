class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    User.find_or_create_by(uid: auth[:uid]) do |user|
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email
    end
  end
end
