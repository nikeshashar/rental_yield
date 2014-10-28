require 'rails_helper'

RSpec.describe Property, :type => :model do

it 'is not valid with a postcode of less than 5 characters' do 
  property = Property.new(postcode: 'EC1Y')
  expect(property).to have(1).error_on(:postcode)
end

it 'is not valid without a cost being entered' do
  property = Property.new(postcode: 'EC1Y 1AA', cost: "")
  expect(property).to have(1).error_on(:cost)
end

it 'is not valid without rent being entered' do 
  property = Property.new(postcode: 'EC1Y 1AA', cost: "1000", rent: "")
  expect(property).to have(1).error_on(:rent)
end

end
