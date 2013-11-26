class ChangeProfitStock < ActiveRecord::Migration
  def up
    change_column :stocks, :profit, :text
  end

  def down
  end
end
