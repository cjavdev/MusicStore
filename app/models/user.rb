class User < ActiveRecord::Base
  attr_accessible :password, :email

  validates :email, :presence => true
  validates :email, :uniqueness => true

  has_many :notes
  
  def password=(password)
    self.password_digest = Digest::SHA2.base64digest(password)
  end
  
  def valid_password?(password)
    self.password_digest == Digest::SHA2.base64digest(password)
  end
  
  def try_activate(token)
    if self.activation_token == token
      self.is_active = true
      self.save!
      return true
    end
    false
  end
  
  def reset_token
    self.token = SecureRandom.base64(16)
    self.save!
    self.token
  end
  
  def get_activation_token
    self.activation_token ||= SecureRandom.base64(16)
    self.save!
    self.activation_token
  end
end
