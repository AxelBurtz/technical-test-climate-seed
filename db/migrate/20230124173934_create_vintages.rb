class CreateVintages < ActiveRecord::Migration[7.0]
  def change
    create_table :vintages do |t|
      t.integer :project_id
      t.string :name

      t.timestamps
    end
    add_index :vintages, :project_id
  end
end
