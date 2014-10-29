require 'rails_helper'

describe 'Properties' do 
  context 'as a logged out user' do 
    context 'no properties added' do 
      it 'should display a prompt to sign up' do 
        visit '/properties'
        expect(page).to have_content 'Sign in'
      end
    end
  end

  context 'properties have been added' do 
    before do 
      john = User.create(email: "john@rentify.com", password: '12345678', password_confirmation: '12345678')
      login_as john
      john.properties.create(postcode: 'EC1Y 1AA', rent: 1000, cost: 200000.00)
    end

    it 'should display creators properties' do 
      visit '/properties'
      expect(page).to have_content 'EC1Y 1AA'
      expect(page).to have_content '£ 1,000.00'
      expect(page).to have_content '£ 200,000.00'
    end
  end

end

