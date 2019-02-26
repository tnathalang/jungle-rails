class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews

    before_validation :strip_whitespace
    before_save :downcase_email
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: {case_sensitive: true}
    validates :password, presence: true, confirmation: true, length: {minimum: 6}
    validates_presence_of :password

    def self.authenticate_with_credentials(email,password)
        # look for user with email inside the db
        # @user = User.find_by_email(email)
        User.find_by_email(email).try(:authenticate, password)
    
    end 

    def strip_whitespace
        self.email = self.email.strip
        self.name = self.name.strip
    end

    def downcase_email
        self.email.downcase!
    end
end
