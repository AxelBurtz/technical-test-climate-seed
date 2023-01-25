class Contribution < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  belongs_to :vintage

  validate :enough_credits_available?

  def enough_credits_available?
    vintage = Vintage.find(vintage_id)
    vintage_offering_sum_of_credits_available = vintage.vintage_offerings.sum(&:available_credits)
    credits_quantity < vintage_offering_sum_of_credits_available
  end
end
