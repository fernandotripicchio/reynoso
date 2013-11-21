class NewColumProdut < ActiveRecord::Migration
  def up
     add_column :products, :supplier_id, :integer
  end

  def down
  end
end
