require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do  
    context 'User Creation' do
      it 'is valid when password and password_confirmation are the same' do
        user = User.new(:name => 'Person', :email => 'person@person.com', :password => 'password', :password_confirmation => 'password') 
        expect(user).to be_valid
      end
      it 'is not valid when password and password_confirmation don\'t match' do
        user = User.new(:name => 'Person', :email => 'person@person.com', :password => 'password', :password_confirmation => '123') 
        expect(user).to_not be_valid
      end
      it 'is not valid when email (not case sensitive) does exist' do
        user = User.create(:name => 'Person', :email => 'person@person.com', :password => 'password', :password_confirmation => 'password').save 
        expect(user).to eq(true)
      end
      it 'is valid when email (not case sensitive) does not exist' do
        user = User.create(:name => 'Person', :email => 'persons@person.com', :password => 'password', :password_confirmation => 'password') 
        expect(user).to be_valid
      end
    end
  end

end
