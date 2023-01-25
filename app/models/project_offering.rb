class ProjectOffering < ApplicationRecord

  belongs_to :seller
  belongs_to :project

  validates :project_id, presence: true
  validates :seller_id, presence: true
  validates :project_description, presence: true
  validates :status, presence: true
end
