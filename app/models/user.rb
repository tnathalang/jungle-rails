class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews

  
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    validates :password, presence: true, confirmation: true, length: {minimum: 6}
    validates_presence_of :password

    def authenticate_with_creditials (email,password)
        # look for user with email inside the db
        @user = User.find_by_email(email)
        # validates the password
        @user.authenticate(password)
      
    end 
end
