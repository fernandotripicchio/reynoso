class AddSupplierStock < ActiveRecord::Migration
  def up
     add_column :stocks, :supplier_id, :integer
  end

  def down
  end
end
