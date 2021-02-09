require 'rails_helper'

describe 'Navbar', type: :system do
  before(:all) do
    User.create(name: 'Test')
  end

  it 'Show current user name when a user is signed in' do
    visit new_session_path
    fill_in 'Name', with: 'Test'
    click_button 'Sign In!'
    expect(page).to have_content('Test')
  end
end
