class Exercices < ActiveRecord::Migration[7.0]
  def change
    create_table :exercices do |t|
      t.belongs_to :seance , foreign_key: true
      t.string :name
      t.integer :repetition

      t.timestamps
    end
  end
end
