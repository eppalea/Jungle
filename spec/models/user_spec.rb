require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'creates a user' do
      @user = User.new(first_name: "EppaLea", last_name: "Turniawan", email: "eppalea@nomail.com", password: "1234", password_confirmation: "1234")
      @user.valid?
      puts @user.errors.full_messages
      expect()
    end
      
    # it 'emails must be unique' do
    #  expect(@user.email.downcase).to be == email.downcase
    # end
  end  
end
