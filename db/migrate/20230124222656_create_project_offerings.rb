class CreateProjectOfferings < ActiveRecord::Migration[7.0]
  def change
    create_table :project_offerings do |t|
      t.integer :project_id
      t.integer :seller_id
      t.string :project_description
      t.string :status

      t.timestamps
    end
    add_index :project_offerings, :project_id
    add_index :project_offerings, :seller_id
  end
end
