class AddSupplierIdProduct < ActiveRecord::Migration
  def up
     add_column :stocks, :suplier_id, :integer
  end

  def down
  end
end
