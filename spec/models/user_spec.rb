require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid when password and password_confirmation are the same' do
      user = User.new('person', 'person@persons.com', 'password', 'password')
      def params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
      expect(user).to be_valid
    end
  end

end
