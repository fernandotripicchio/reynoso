class CreateStockLogs < ActiveRecord::Migration
  def change
    create_table :stock_logs do |t|
      t.integer :stock_id
      t.integer :supplier_id
      t.string  :type
      t.timestamps
    end
  end
end
