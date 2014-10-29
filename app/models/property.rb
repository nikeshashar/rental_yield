class Property < ActiveRecord::Base
  belongs_to :user
  validates :postcode, length: { minimum: 5, message: "you have entered is invalid." }
  validates :cost, presence: true
  validates :rent, presence: true

  def rental_yield
    (((rent * 12) / cost) * 100)
  end
end
