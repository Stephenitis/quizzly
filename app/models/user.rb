class User < ActiveRecord::Base
  include BCrypt

  has_many :games
  has_many :decks
  validates :username, :email, :password, :presence => true
  validates :username, :uniqueness => true
  validates :email, :uniqueness => true

  def valid_email
    unless email =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
      errors.add(:email, "Not a valid email, son")
    end
  end

  def username_length
    unless password.length > 3
      errors.add(:username, "Username ain't long enough, son")
    end
  end

  def password_length
    unless password.length > 6
      errors.add(:password, "Password ain't long enough, son")
    end
  end

  def authenticate(username, password) 
    user = User.where("username = ?", username).first
    user && user.password == password
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

