class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :username, :email, :password, :password_confirmation
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :presence => true, :uniqueness => {case_sensitive: false}, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => {with: EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true


  has_many :messages, through: :inboxes
  has_many :messages, through: :outboxes
end
