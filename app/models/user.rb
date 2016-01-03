class User < ActiveRecord::Base
  belongs_to :article
  before_save {self.email = email.downcase }
  validates :username, presence: true, uniqueness: true,length: {minimum: 3, maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 50},
                    format: { with: VALID_EMAIL_REGEX}
end
