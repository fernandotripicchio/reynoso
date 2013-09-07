class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :product_id
      t.integer :branch_id
      t.timestamps
    end
  end
end
