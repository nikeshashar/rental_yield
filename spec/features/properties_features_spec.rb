require 'rails_helper'

describe 'properties' do 
  context 'no properties added' do 
    it 'should display a prompt to add a new property' do 
      visit '/properties'
      expect(page).to have_content 'No properties yet!'
      expect(page).to have_link 'Add a property'
    end
  end
end