class Seance < ApplicationRecord

  belongs_to :user
  has_many :exercices
  after_create :create_exercices

  validates :name, presence: true, uniqueness: true
  validates :exercice, presence: true



  private
  def create_exercices
    for exercice in self.exercice do
      @exercice = Exercice.new(name: exercice['name'], repetition: exercice['repetition'], seance_id: self.id)
      @exercice.save!
    end
  end
end
