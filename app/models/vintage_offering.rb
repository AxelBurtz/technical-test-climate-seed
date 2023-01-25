class VintageOffering < ApplicationRecord
  belongs_to :seller
  belongs_to :vintage
  belongs_to :project

  validates :seller_id, presence: true
  validates :vintage_id, presence: true
  validates :available_credits, presence: true
  validates :price, presence: true

end
