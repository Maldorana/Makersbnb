require './lib/request'
require './lib/space'
require './lib/user'

feature 'Viewing requests' do
    scenario 'user can view requests that has been made for spaces' do
        user = User.create(email: 'test@test.com', username: 'test12', password: 'test123')
        space = Space.add(name: "Spacename1", description: "Spacedescription1", price: "Spaceprice1")
        Request.add(space_id: "#{space.id}", user_id: "#{user.id}", date: "20210924")
    

        visit('/users/requests')
    
        expect(page).to have_content("Spacename1")
        
    end
end