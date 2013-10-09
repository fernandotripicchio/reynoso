class AddFieldsProduct < ActiveRecord::Migration
  def up
    rename_column :products, :price, :cost
    add_column :products, :code, :string    
  end

  def down
  end
end
