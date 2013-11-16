class AddClientBalance < ActiveRecord::Migration
  def up
    add_column :balances, :client_id, :integer
  end

  def down
  end
end
