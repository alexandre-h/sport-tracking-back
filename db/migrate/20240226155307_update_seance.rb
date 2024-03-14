class UpdateSeance < ActiveRecord::Migration[7.0]
  def change
    drop_table :seances
  end
end
