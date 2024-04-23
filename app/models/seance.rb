class Seance < ApplicationRecord
  belongs_to :user
  has_many :exercices, dependent: :destroy
  belongs_to :seance_template

  accepts_nested_attributes_for :exercices, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end
