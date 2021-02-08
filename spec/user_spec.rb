require 'rails_helper'

describe User, type: :model do
  before(:each) do
    User.create(name: 'Test')
  end
  let(:user) { User.new }

  context 'validate presence of require atributes' do
    it 'returns true when user have a name' do
      user.name = 'user'
      expect(user.valid?).to be true
    end
    it 'returns false when user don\'t have a name' do
      expect(user.valid?).to be false
    end
  end

  context 'validate username uniqueness' do
    it 'returns true when username is unique' do
      user.name = 'user'
      expect(user.valid?).to be true
    end
    it 'returns false when username isn\'t unique' do
      user.name = 'Test'
      expect(user.valid?).to be false
    end
  end
end
