class Vintage < ApplicationRecord

  belongs_to :project

  validates :name, presence: true
  validates :project_id, presence: true, numericality: { only_integer: true }, on: :create
end
