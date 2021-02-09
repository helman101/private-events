require 'rails_helper'

describe Event, type: :model do
  let(:user) { User.new }
  subject { Event.new(name: 'Test', description: 'description', date: Date.current, creator: user) }

  context 'Validations' do
    context 'Precense' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:date) }
    end
  end

  context 'Associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:attendances) }
    it { should have_many(:attendees).through(:attendances) }
  end
end
