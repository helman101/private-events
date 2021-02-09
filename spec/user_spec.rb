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

  context 'Associations' do
    it { should have_many(:created_events).class_name('Event') }
    it { should have_many(:attendances) }
    it { should have_many(:attended_events).through(:attendances) }
  end
end
