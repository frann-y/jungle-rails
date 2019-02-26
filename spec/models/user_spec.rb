require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new
    @user.first_name = "Do"
    @user.last_name = "Nut"
    @user.email = "donuts@example.com"
    @user.password = "donuts"
    @user.password_confirmation = "donuts" 
    @user.save #saves for the db lookup
  end

#Test to validates everything exists
  it "is valid if it all exists" do
    expect(@user).to be_valid
  end

#step 2
#a. : Password and password confirmation
  it "is not valid without a password" do
    @user.password =  nil
    @user.password_confirmation = nil 
    expect(@user).to_not be_valid
  end

#a :diff password
  it "is not valid with different passwords" do
    @user.password =  "donuts"
    @user.password_confirmation = "bagels"
    expect(@user).to_not be_valid
  end

#b. Emails must be unique and NOT case sensitive
  it "is not valid with email duplicate" do
    #create a second user?
    @user2 = User.new
    @user2.first_name = "Banana"
    @user2.last_name = "Bread"
    @user2.email = "Donuts@example.com"
    @user2.password = "banana"
    @user2.password_confirmation = "banana"

    expect(@user2).to_not be_valid
  end

#c. i. email present
  it "is not valid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end


# ii.firstname present
  it "is not valid without a first_name" do
    @user.first_name = nil
    expect(@user).to_not be_valid
  end

#iii. last name must be required/present
  it "is not valid without a last_name" do
    @user.last_name = nil
    expect(@user).to_not be_valid
  end

#step 3
#password must have a minimum length, maybe 6?
  it "is valid if password is 6 or more characters" do
    @user.password = "whut"
    @user.password_confirmation = "whut"
    expect(@user).to_not be_valid
  end

#step 4

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    # create a test where 
    it "is an authenticated user if the email matches the password" do 
      #check it is not nil using the user auth 
      authent_cred = User.authenticate_with_credentials(@user.email, @user.password)
      expect(authent_cred).to_not be_valid
    end
  end


#==================================
#step 4.2
#a. whitespace with email
   it "is valid if there is whitespace before or after email" do
     @user.email = "  donuts@example.com  "
     expect(@user).to be_valid
    end

end

