class RemoveSupplierFromStock < ActiveRecord::Migration
  def up
    remove_column :stocks, :supplier_id
  end

  def down
  end
end
