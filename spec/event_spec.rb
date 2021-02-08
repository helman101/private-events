require 'rails_helper'

describe Event, type: :model do
  let(:user) { User.new }
  let(:evt) { Event.new(creator: user) }
  context 'validate presence of require atributes' do
    it 'returns true when event date is present' do
      evt.description = 'test description'
      evt.date = '13-10-2021'
      evt.name = 'test'
      expect(evt.valid?).to be true
    end

    it 'returns false when event date isn\'t present' do
      evt.description = 'test description'
      evt.name = 'test'
      expect(evt.valid?).to be false
    end

    it 'returns true when event description is present' do
      evt.description = 'test description'
      evt.date = '13-10-2021'
      evt.name = 'test'
      expect(evt.valid?).to be true
    end

    it 'returns false when event description isn\'t present' do
      evt.date = '13-10-2021'
      evt.name = 'test'
      expect(evt.valid?).to be false
    end
  end

  context 'make sure the event belong to a creator' do
    it 'returns true if event have a creator' do
      ev = Event.new(date: Date.current, name: 'Test 2', description: 'Test description 2', creator: user)
      expect(ev.valid?).to be true
    end

    it 'returns false if event don\'t have a creator' do
      ev = Event.new(date: Date.current, name: 'Test 2', description: 'Test description 2')
      expect(ev.valid?).to be false
    end
  end
end
