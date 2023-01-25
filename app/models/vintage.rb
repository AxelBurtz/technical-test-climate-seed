class Vintage < ApplicationRecord

  belongs_to :project
  has_many :vintage_offerings
  has_many :contributions

  validates :name, presence: true
  validates :project_id, presence: true, numericality: { only_integer: true }, on: :create
end
