class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :size
      t.integer :branch_id
      t.integer :product_id
      t.decimal :disccount,  :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
