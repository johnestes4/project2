class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save :normalize_fields

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :presence => true, :uniqueness => {case_sensitive: false}, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => {with: EMAIL_REGEX }

  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  has_secure_password

  has_many :messages, through: :inboxes
  has_many :messages, through: :outboxes
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    remember_token = User.hash(User.new_remember_token)
  end

  def normalize_fields
    self.email.downcase!
  end

end
