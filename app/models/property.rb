class Property < ActiveRecord::Base
  validates :postcode, length: { minimum: 5 }
end
