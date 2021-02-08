require 'rails_helper'

describe 'session pages', type: :system do
  before(:all) do
    User.create(name: 'Test')
  end

  it 'Sign in takes you to user_path' do
    visit new_session_path
    fill_in 'Name', with: 'Test'
    click_button 'Sign In!'
    expect(page.current_path).to eq(user_path(User.find_by(name: 'Test')))
  end

  it 'Sign up takes you to user_path' do
    visit new_user_path
    fill_in 'Name', with: 'New'
    click_button 'Sign up!'
    expect(page.current_path).to eq(user_path(User.find_by(name: 'New')))
  end

  it 'Sign out takes you to root_path' do
    visit new_session_path
    fill_in 'Name', with: 'Test'
    click_button 'Sign In!'
    click_link 'Sign Out'
    expect(page.current_path).to eq(root_path)
  end
end
