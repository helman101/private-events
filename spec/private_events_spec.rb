require 'rails_helper'


describe User, type: :model do
  before(:all) do
    User.create!(name: 'Test')
  end

  context 'The new user' do
    it 'have unique name' do
      user = User.new(name: 'Andres')
      expect(user.valid?).to be true
    end
    it 'does not repeat a existing name' do
      user2 = User.new(name: 'Test')
      expect(user2.valid?).to be false
    end
  end
end

describe Event, type: :model do
  context 'The new event' do
    it 'have present name, description, date and have a creator' do
      event = Event.new(name: 'Test title', description: 'Test', date: '13-10-1997', creator_id: 1)
      expect(event.valid?).to be true
    end
  end
end

describe Attendance, type: :model do 
  before(:all) do
    @user = User.first
    @event = @user.created_events.build(name: 'Test title', description: 'Test', date: '13-10-1997', creator_id: 1)
    @user.attended_events << @event
  end

  context 'Event create an attendance' do
    it 'have present attendees' do
      expect(Attendance.first.attendee_id).to match(@user.id)
    end
    it 'have present events' do
      expect(Attendance.first.attended_event_id).to match(@event.id)
    end
  end
end

describe 'Private Events', type: :system do
  context 'Navbar' do
    before(:each) do
      visit root_path
    end

    it 'Have link to events index page' do
      expect(page).to have_link('Home')
    end

    it 'Have link to create a new user' do
      expect(page).to have_link('Sign Up')
    end
    it 'Dont have a link to create an event' do
      expect(page).to_not have_link('New event')
    end
  end

  context 'Index events page' do
    it 'Have a link to show event page' do
      visit events_path
      expect(page).to have_link('Test title')
    end
  end

  context 'New event page' do
    it 'Have a form to create an event' do
      visit new_event_path
      expect(page).to have_content('Create an Event')
    end
  end
  
end
