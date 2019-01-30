class Chef < ApplicationRecord
  before_save { self.email = email.downcase }
  validates_presence_of :chefname, length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email, length: { maximum: 255},
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: {case_sensitive: false}
  has_many :recipes                       

end
