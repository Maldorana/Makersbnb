feature 'deleting space' do
  scenario 'user delete a space' do
    Space.add(name: "Spacename3", description: "Spacedescription3", price: "Spaceprice3")

    visit('/spaces/index')

    expect(page).to have_content("Spacename3")
    expect(page).to have_content("Spacedescription3")
    expect(page).to have_content("Spaceprice3")
    expect(page).to have_button("Delete")

    click_button('Delete')

    expect(current_path).to eq('/spaces/index')
    
    expect(page).not_to have_content("Spacename3")
    expect(page).not_to have_content("Spacedescription3")
    expect(page).not_to have_content("Spaceprice3")
  end
end