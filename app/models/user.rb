class User < ActiveRecord::Base
  attr_accessible :username, :password

  before_validation :reset_session_token

  has_many :goals
  has_many :cheers

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    reset_session_token
    self.save
    self.session_token
  end

  def self.find_by_credentials(params)
    u = User.find_by_username(params[:username])
    if u && u.is_password?(params[:password])
      u
    else
      nil
    end
  end
end
