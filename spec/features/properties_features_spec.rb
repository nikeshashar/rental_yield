require 'rails_helper'

describe 'Properties' do 
  context 'no properties added' do 
    it 'should display a prompt to add a new property' do 
      visit '/properties'
      expect(page).to have_content 'Sign in'
    end
  end

  context 'properties have been added' do 
    before do 
      john = User.create(email: "john@rentify.com", password: '12345678', password_confirmation: '12345678')
      login_as john
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

