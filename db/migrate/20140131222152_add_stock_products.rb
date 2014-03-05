class AddStockProducts < ActiveRecord::Migration
  def up
      add_column :items, :stock_id, :integer
  end

  def down
  end
end
