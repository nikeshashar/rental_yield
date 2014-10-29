require 'rails_helper'

describe 'editing properties' do 
  before do 
    @john = User.create(email: "john@rentify.com", password: '12345678', password_confirmation: '12345678')
    login_as @john
    @john.properties.create(postcode: 'EC1Y 1AA', rent: 1000, cost: 200000)
  end

  context 'logged in as creator' do 
    before do 
      login_as @john
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

  context 'logged in as another user' do 
    before do 
      mike = User.create(email: "mike@rentify.com", password: '12345678', password_confirmation: '12345678')
      login_as mike
    end
    it 'should show an error' do 
      visit '/properties'
      click_link 'Edit property'
      expect(page).to have_content 'This is not your property!'
    end

  end
end