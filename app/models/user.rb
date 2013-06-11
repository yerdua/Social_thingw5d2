class User < ActiveRecord::Base
  attr_accessible :username, :password

  def password=(password)
    # fancy digest code
    self.password_digest = BCrypt::Password.create(password) #setup Bcrypt code here
  end

  def password
    password_digest
  end

  def verify_password(login_password)
    BCrypt::Password.new(self.password_digest) == login_password
  end

  def reset_session_token!
    self.session_token = SecureRandom::base64(32)
    self.save!
  end
end