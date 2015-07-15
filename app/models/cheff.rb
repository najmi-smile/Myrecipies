class Cheff < ActiveRecord::Base
 has_many :recipes
 before_save {self.email = email.downcase}
  validates :name, presence: true, length: {minimum: 5, maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 55},
                                    uniqueness: {case_sensitive: false},
                                    format: {with: VALID_EMAIL_REGEX}
end
