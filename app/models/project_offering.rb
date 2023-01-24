class ProjectOffering < ApplicationRecord

  belongs_to :seller
  belongs_to :project
end
