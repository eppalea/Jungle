require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'creates a user' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "1234", password_confirmation: "1234")
      puts @user.errors.full_messages
      expect(@user).to be_valid
    end
      
    it 'emails must be unique' do
      @user = User.create(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "1234", password_confirmation: "1234")
      @user = User.create(first_name: "Jenny", last_name: "Mac", email: "eppalea@nomail.com", password: "12345", password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it 'contains first name' do
      @user = User.create(first_name: nil, last_name: "Turniawan", email: "eppalea@nomail.com", password: "1234", password_confirmation: "1234")
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end


    it 'contains last name' do
      @user = User.create(first_name: "EppaLea", last_name: nil, email: "eppalea@nomail.com", password: "1234", password_confirmation: "1234")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

  end  
end


# it 'contains a price' do
#   @category = Category.create(name: "games")
#   @product = Product.create(name: "Gameboy", price: nil , quantity: 5, category: @category)
#   expect(@product.errors.full_messages).to include("Price can't be blank")
# end