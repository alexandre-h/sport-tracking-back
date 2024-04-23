class UpdateSeanceModel < ActiveRecord::Migration[7.0]
  def change
    add_reference :seances, :seance_template, foreign_key: true
  end
end
