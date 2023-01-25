class CreateVintageOfferings < ActiveRecord::Migration[7.0]
  def change
    create_table :vintage_offerings do |t|
      t.integer :seller_id
      t.integer :vintage_id
      t.integer :project_id
      t.integer :available_credits
      t.float :price

      t.timestamps
    end
    add_index :vintage_offerings, :seller_id
    add_index :vintage_offerings, :vintage_id
    add_index :vintage_offerings, :project_id
  end
end
