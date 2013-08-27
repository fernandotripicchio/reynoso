class ModifyPriceColumnProducts < ActiveRecord::Migration
  def up
    change_column :products, :price, :decimal, :precision => 8, :scale => 2
    change_column :products, :iva, :decimal, :precision => 8, :scale => 2
    change_column :products, :profit, :decimal, :precision => 8, :scale => 2
  end

  def down
  end
end
