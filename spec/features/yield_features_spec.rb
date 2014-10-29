describe 'creating properties' do 

  before do 
    @john = User.create(email: "john@rentify.com", password: '12345678', password_confirmation: '12345678')
    login_as @john
  end
  
  it 'shows a form and then displays the information' do 
    visit '/properties'
    click_link 'Add a property'
    fill_in "Postcode", with: 'EC1Y 1AA'
    fill_in 'Rent', with: '1000'
    fill_in 'Cost', with: 200000
    click_button 'Create Property'
    expect(page).to have_content 'Rental Yield: 6.00%'
    expect(current_path).to eq '/properties'
  end
end
