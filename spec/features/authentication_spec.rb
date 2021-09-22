require 'database_helper'
require './lib/user'

feature 'authentication' do 
  it 'a user can sign in' do 
    User.create(email: 'test@test.com', username: 'test12', password: 'test123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@test.com')
    fill_in(:username, with: 'test12')
    fill_in(:password, with: 'test123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, test12'
  end 
end 


