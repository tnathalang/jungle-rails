require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before(:each) do
      @user = User.new
      @user.name = "Pepega"
      @user.email = "pepega@mail.m"
      @user.password = "pepegamonkas"
      @user.password_confirmation = "pepegamonkas"
    end
    it 'Should have a name' do
      @user.name = nil 
      expect(@user).to_not be_valid
    end
    it 'Should have an email' do
      @user.email = nil 
      expect(@user).to_not be_valid
    end
    
    describe '.authenticate_with_credentials' do 

    end
  end 
end
