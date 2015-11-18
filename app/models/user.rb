include BCrypt

class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :email, :username, :name, :password, presence: true

  has_many :albums

  def password 
  	@password ||= Password.new(password_digest)
  end

  def password=(user_password)
  	@password = Password.create(user_password)
  	self.password_digest = @password
  end

  def self.authenticate(email, user_password)
  	user = User.find_by(email: email)
  	if user && (user.password == user_password)
  		return user
  	else
  		nil
  	end
  end
end
