require 'rails_helper'

describe 'Properties' do 
  context 'no properties added' do 
    it 'should display a prompt to add a new property' do 
      visit '/properties'
      expect(page).to have_content 'No properties yet!'
      expect(page).to have_link 'Add a property'
    end
  end

  context 'properties have been added' do 
    before do 
      Property.create(postcode: 'EC1Y 1AA', rent: 1000, cost: 200000)
    end

    it 'should display them' do 
      visit '/properties'
      expect(page).to have_content 'EC1Y 1AA'
      expect(page).to have_content '1000'
      expect(page).to have_content '200000'
    end
  end
end

describe 'creating properties' do 
  it 'shows a form and then displays the information' do 
    visit '/properties'
    click_link 'Add a property'
    fill_in "Postcode", with: 'EC1Y 1AA'
    fill_in 'Rent', with: '1000'
    fill_in 'Cost', with: 200000
    click_button 'Create Property'
    expect(page).to have_content 'EC1Y 1AA'
    expect(page).to have_content '1000'
    expect(page).to have_content '200000'
    expect(current_path).to eq '/properties'
  end
end

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

describe 'deleting properties' do 
  before do 
    Property.create(postcode: 'EC1Y 1AA', rent: 1000, cost: 200000)
  end

  it 'allows a user to delete the propety' do 
    visit '/properties'
    click_link 'Delete property'
    expect(page).not_to have_content 'HA7 4SP'
    expect(page).to have_content 'Property deleted successfully'
    expect(current_path).to eq '/properties'
  end
end