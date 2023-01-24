class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :registry_name
      t.string :country
      t.string :typology
      t.boolean :is_validated

      t.timestamps
    end
  end
end
