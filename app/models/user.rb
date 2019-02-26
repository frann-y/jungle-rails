class User < ActiveRecord::Base
    has_secure_password #does stuff behind , does stuff!!
    has_many :reviews

    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, length: { minimum: 6 }



    def self.authenticate_with_credentials(email, password)
        email = email.strip
        user = User.find_by email: email
        
        if user && user.authenticate(password)
          user
        else
          nil
        end
    end   
end

