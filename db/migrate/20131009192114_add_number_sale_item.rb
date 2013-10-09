class AddNumberSaleItem < ActiveRecord::Migration
  def up
     add_column :sale_items, :size, :integer 
  end

  def down
  end
end
