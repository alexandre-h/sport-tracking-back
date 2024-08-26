class SeanceTemplate < ApplicationRecord
  has_many :seances
  belongs_to :user

  validates :name, presence: true
  validates :exercice, presence: true
end
