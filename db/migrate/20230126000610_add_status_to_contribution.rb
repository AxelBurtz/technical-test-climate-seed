class AddStatusToContribution < ActiveRecord::Migration[7.0]
  def change
    add_column :contributions, :status, :string
  end
end
