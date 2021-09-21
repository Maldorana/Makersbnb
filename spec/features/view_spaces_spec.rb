feature 'view spaces' do
  scenario 'user lands on page and see the spaces' do
    visit('/spaces/index')

    expect(page).to have_content('Spacename1')
    expect(page).to have_content('Spacename2')
    expect(page).to have_content('Spacename3')
  end
end