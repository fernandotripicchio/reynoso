class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date_sale
      t.integer :branch_id
      t.integer :client_id
      t.timestamps
    end
  end
end
