class User < ApplicationRecord
  before_save { email.downcase! }
  before_save :set_username

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  devise :uid, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }

   validates :password, presence: true, length: { minimum: 8 }
   validates :first_name, presence: true
   validates :last_name,  presence: true
   validates :username, uniqueness: { case_sensitive: false }
   
   def full_name
     self.first_name.capitalize + ' ' + self.last_name.capitalize
   end

   private

   def set_username
     self.username = self.first_name + self.last_name if username.nil?
   end

end
