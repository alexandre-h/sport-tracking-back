class CreateSeanceTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :seance_templates do |t|
      t.belongs_to :user , foreign_key: true
      t.string :name
      t.timestamps
    end
    add_column :seance_templates, :exercice, :jsonb, default: []
  end
end
