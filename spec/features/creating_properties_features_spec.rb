require 'rails_helper'

  context 'logged out' do 
    it 'should prompt to sign in' do 
      visit '/properties'
      expect(page).to have_content 'Sign in'
    end
  end

  context 'logged in' do

    before do 
      john = User.create(email: "john@rentify.com", password: '12345678', password_confirmation: '12345678')
      login_as john
    end 
    
    describe 'creating properties' do 
      context 'a valid entry' do 
        it 'shows a form and then displays the information' do 
          visit '/properties'
          click_link 'Add a property'
          fill_in "Postcode", with: 'EC1Y 1AA'
          fill_in 'Rent', with: '1000'
          fill_in 'Cost', with: 200000
          click_button 'Create Property'
          expect(page).to have_content 'EC1Y 1AA'
          expect(page).to have_content '£ 1,000.00'
          expect(page).to have_content '£ 200,000.00'
          expect(current_path).to eq '/properties'
        end
      end

    context 'an invalid entry' do 
      it 'does not create a property if the postcode is too short' do 
        visit '/properties'
        click_link 'Add a property'
        fill_in "Postcode", with: 'EC1Y'
        click_button 'Create Property'
        expect(page).to have_content 'error'
        expect(page).not_to have_content 'EC1Y'
      end
    end
  end
end