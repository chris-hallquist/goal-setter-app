class User < ActiveRecord::Base
  attr_accessible :username, :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
  end
end
