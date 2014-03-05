class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :size
      t.integer :sale_id
      t.integer :product_id
      t.timestamps
    end
  end
end
