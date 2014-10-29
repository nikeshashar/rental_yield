require 'rails_helper'

describe 'editing properties' do 
  before do 
    Property.create(postcode: 'EC1Y 1AA', rent: 1000, cost: 200000)
  end

  it 'allows a user to edit the propety' do 
    visit '/properties'
    click_link 'Edit property'
    fill_in "Postcode", with: 'HA7 4SP'
    click_button 'Update Property'
    expect(page).to have_content 'HA7 4SP'
    expect(current_path).to eq '/properties'
  end
end