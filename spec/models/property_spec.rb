require 'rails_helper'

RSpec.describe Property, :type => :model do

describe '#rental_yield' do 
  it 'returns the rental yield when the property details are entered' do 
    property = Property.new(postcode: 'EC1Y 1AA', cost: "100000", rent: "1000")
    expect(property.rental_yield).to eq 12.00
  end

  it 'returns the rental yield as a float, when the property details are entered' do 
    property = Property.new(postcode: 'EC1Y 1AA', cost: "100000", rent: "900")
    expect(property.rental_yield).to eq 10.80
  end
end

describe 'validations' do 
  it 'is valid with postcode, cost and rent entered correctly' do 
    property = Property.new(postcode: 'EC1Y 1AA', cost: "100000", rent: "1000")
    expect(property).to be_valid
  end

  it 'is not valid with a postcode of less than 5 characters' do 
    property = Property.new(postcode: 'EC1Y')
    expect(property).to have(1).error_on(:postcode)
  end

  it 'is not valid without a cost being entered' do
    property = Property.new(postcode: 'EC1Y 1AA', cost: "")
    expect(property).to have(1).error_on(:cost)
  end

  it 'is not valid without rent being entered' do 
    property = Property.new(postcode: 'EC1Y 1AA', cost: "100000", rent: "")
    expect(property).to have(1).error_on(:rent)
  end
end

end
