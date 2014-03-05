class ChangeColumnsBalance < ActiveRecord::Migration
  def up
     rename_column :balances, :kind_of_movm, :kind_of_mov
     add_column :balances, :kind_movement_id, :integer
     add_column :balances, :branch_id, :integer
  end

  def down
  end
end
