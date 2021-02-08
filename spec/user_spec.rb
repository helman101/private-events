require 'rails_helper'

describe User, type: :model do
  before(:each) do
    User.create(name: 'Test')
  end
  subject { User.new(name: 'Andy') }

  context 'Validations' do
    context 'Precense' do
      it { should validate_presence_of(:name) }
    end
    context 'Uniqueness' do
      it { should validate_uniqueness_of(:name) }
    end
  end
end
