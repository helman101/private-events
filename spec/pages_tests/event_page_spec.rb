require 'rails_helper'

describe 'Event pages', type: :system do
  before(:all) do
    user = User.create(name: 'Test')
  end

  it 'Show a create event link if a user is signed in' do
    visit new_session_path
    fill_in 'Name', with: 'Test'
    click_button 'Sign In!'
    expect(page).to have_content('New Event')
  end

  it 'Takes you to new_event_path when click New Event button' do
    visit new_session_path
    fill_in 'Name', with: 'Test'
    click_button 'Sign In!'
    click_link 'New Event'
    expect(page.current_path).to eql(new_event_path)
  end

  it 'Takes you to the event_path when create a event' do
    visit new_session_path
    fill_in 'Name', with: 'Test'
    click_button 'Sign In!'
    click_link 'New Event'
    fill_in 'Name', with: 'Test title'
    fill_in 'Description', with: 'test description'
    fill_in 'Date', with: Date.current
    click_button 'Create event'
    expect(page.current_path).to eql(user_path(User.find_by(name: 'Test')))
  end
end
