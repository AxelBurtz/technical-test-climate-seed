class CreateContribution < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :vintage_id
      t.integer :credits_quantity
      t.float :price

      t.timestamps
    end
  end
end
