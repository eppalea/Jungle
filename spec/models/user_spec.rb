require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'creates a user' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
      puts @user.errors.full_messages
      expect(@user).to be_valid
    end
          
    it 'contains first name' do
      @user = User.create(first_name: nil, last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
        
    it 'contains last name' do
      @user = User.create(first_name: "EppaLea", last_name: nil, email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'password has minimum length of 6 characters' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "1234", password_confirmation: "1234")
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'contains matching passwords' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'contains a password' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: nil, password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'contains a password confirmation' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    
    it 'contains an email' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: nil, password: "123456", password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it 'emails must be unique' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
      @user = User.create(first_name: "Jenny", last_name: "Mac", email: "eppalea@nomail.com", password: "1234567", password_confirmation: "1234567")
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
  end  

  describe '.authenticate_with_credentials' do
    it 'logs in a user' do
    @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
    authenticate = User.authenticate_with_credentials(@user.email, @user.password)
    expect(authenticate).to_not be_nil
    end

    it 'fails to log in user' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
      authenticate = User.authenticate_with_credentials(@user.email, "helloworld")
      expect(authenticate).to be_nil
    end

    it 'should ignore whitespace' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
      authenticate = User.authenticate_with_credentials("   eppalea@nomail.com", @user.password)
      expect(authenticate).to_not be_nil
    end

    it 'should ignore case in email' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "123456", password_confirmation: "123456")
      authenticate = User.authenticate_with_credentials("EppAlEA@nomail.com", @user.password)
      expect(authenticate).to_not be_nil
    end
  end

end


