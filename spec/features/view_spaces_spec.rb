feature 'view spaces' do
  scenario 'user lands on page and see the spaces' do
    Space.add(name: "Spacename1", description: "Spacedescription1", price: "Spaceprice1")
    Space.add(name: "Spacename2", description: "Spacedescription2", price: "Spaceprice2")
    Space.add(name: "Spacename3", description: "Spacedescription3", price: "Spaceprice3")

    visit('/spaces/index')
    
    expect(page).to have_content('Spacename1')
    expect(page).to have_content('Spacedescription1')
    expect(page).to have_content('Spaceprice1')
    expect(page).to have_content('Spacename2')
    expect(page).to have_content('Spacedescription2')
    expect(page).to have_content('Spaceprice2')
    expect(page).to have_content('Spacename3')
    expect(page).to have_content('Spacedescription3')
    expect(page).to have_content('Spaceprice3')
  end
end