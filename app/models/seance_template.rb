class SeanceTemplate < ApplicationRecord
  has_many :seances
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :exercice, presence: true
end
