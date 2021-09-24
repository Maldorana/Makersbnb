require 'database_helper'
require './lib/user'

feature 'authentication' do 
  scenario 'a user can sign in' do 
    User.create(email: 'test@test.com', username: 'test12', password: 'test123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'test123')
    click_button('Log in')
    expect(page).to have_content 'Welcome'
  end 

  scenario 'a user can sign out' do 
    User.create(email: 'test@test.com', username: 'test12', password: 'test123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'test123')
    click_button('Log in')

    click_button('Sign out')

    expect(page).not_to have_content('CSS')
  end
end 


