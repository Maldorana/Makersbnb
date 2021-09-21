feature 'add a new space' do
  scenario 'user can add a new space' do
    visit('/spaces/new')

    fill_in :name, with: 'Spacename4'
    fill_in :description, with: 'Spacedescription4'
    fill_in :price, with: 'Spaceprice4'
    click_button 'Add space'

    expect(page).to have_content('Spacename4')
  end
end