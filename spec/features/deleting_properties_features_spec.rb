require 'rails_helper'

describe 'deleting properties' do 

  before do 
    @john = User.create(email: "john@rentify.com", password: '12345678', password_confirmation: '12345678')
    login_as @john
    @john.properties.create(postcode: 'EC1Y 1AA', rent: 1000, cost: 200000)
  end

  context 'as the property creator' do 
    it 'allows a user to delete the propety' do 
      visit '/properties'
      click_link 'Delete property'
      expect(page).not_to have_content 'HA7 4SP'
      expect(page).to have_content 'Property deleted successfully'
      expect(current_path).to eq '/properties'
    end
  end

  context 'logged in as another user' do 

    before do 
      mike = User.create(email: "mike@rentify.com", password: '12345678', password_confirmation: '12345678')
      login_as mike
    end
    
    it 'should show an error' do 
      visit '/properties'
      expect(page).not_to have_link 'Delete property'
    end
  end
end