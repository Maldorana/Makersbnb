feature 'add request' do
  scenario 'add request for a given space' do
    space = Space.add(name: "Spacename3", description: "Spacedescription3", price: "Spaceprice3")
    
    visit("/spaces/#{space.id}/show")

    expect(page).to have_content('Show')
    expect(page).to have_content('Spacename3')
    expect(page).to have_content('Spacedescription3')
    expect(page).to have_content('Spaceprice3')
    expect(page).to have_content('Book this space')
    expect(page).to have_field('Date')
    expect(page).to have_button('Request booking')
  end
end