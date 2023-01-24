class Seller < ApplicationRecord

  has_many :project_offerings

  validates :name, presence: true
end
