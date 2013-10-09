class AddProductDescription < ActiveRecord::Migration
  def up
     add_column :products, :description, :text
  end

  def down
  end
end
