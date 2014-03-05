class AddRemitoSales < ActiveRecord::Migration
  def up
     add_column :sales, :remito, :string
  end

  def down
    remove_column :sales, :remito
  end
end
