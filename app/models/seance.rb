class Seance < ApplicationRecord
  scope exercice_done: where(seance_id: self.id)
  belongs_to :user
  has_many :exercices
  after_create :create_exercices

  validates :name, presence: true, uniqueness: true
  validates :exercice, presence: true



  private
  def create_exercices
    p "this is exercice :::::: "
    p self.exercice
    for exercice in self.exercice do
      p "exercice.name ::: "
      p exercice['name']
      @exercice = Exercice.new(name: exercice['name'], repetition: exercice['repetition'], seance_id: self.id)
      @exercice.save!
    end
  end
end
