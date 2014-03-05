class AddStockCritico < ActiveRecord::Migration
  def up
     add_column :stocks, :minimum, :integer
  end

  def down
    remove_column :stocks, :minimum
  end
end
