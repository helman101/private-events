require 'rails_helper'

describe Event, type: :model do
  let(:att) { Attendance.new }
  let(:user) { User.create(name: 'user') }
  let(:evt) { Event.create(name: 'Test', description: 'Test description', date: Date.current) }

  context 'associations' do
    it 'returns true when do have attendee and attended_event' do
      att.attendee = user
      att.attended_event = evt
      expect(att.valid?).to be true
    end

    it 'returns false when doesn\'t have attendee or attended_event' do
      att.attended_event = evt
      expect(att.valid?).to be false
    end
  end

  context 'relations' do
    it 'attendee is equal to user' do
      att.attendee = user
      att.attended_event = evt
      expect(att.attendee).to eq(user)
    end

    it 'attended_event is equal to event' do
      att.attendee = user
      att.attended_event = evt
      expect(att.attended_event).to eq(evt)
    end
  end
end
