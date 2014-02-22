class ChangeBalanceField < ActiveRecord::Migration
  def up
    rename_column :balances, :size, :mount
  end

  def down
  end
end
