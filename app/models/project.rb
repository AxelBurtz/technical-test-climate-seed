class Project < ApplicationRecord

  has_many :vintages

  validates :name, presence: true
  validates :registry_name, inclusion: { in: ['Verra', 'Gold Standard', 'Plan Vivo'] }
  validates :country, presence: true
  validates :typology, inclusion: { in: ['forestry', 'cookstoves', 'water purifiers'] }
  validates :is_validated, inclusion: { in: [true, false] }
end
