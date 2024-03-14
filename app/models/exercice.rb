class Exercice < ApplicationRecord
  belongs_to :seance

  validates :name, presence: true
end
