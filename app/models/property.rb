class Property < ActiveRecord::Base
  validates :postcode, length: { minimum: 5, message: "you have entered is invalid." }
  validates :cost, presence: true
end
