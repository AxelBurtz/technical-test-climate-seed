class Seller < ApplicationRecord

  has_many :project_offerings
  has_many :vintage_offerings

  validates :name, presence: true
end
