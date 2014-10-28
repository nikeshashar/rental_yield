require 'rails_helper'

RSpec.describe Property, :type => :model do

it 'is not valid with a postcode of less than 5 charachters' do 
  property = Property.new(postcode: 'EC1Y')
  expect(property).not_to be_valid
end

end
