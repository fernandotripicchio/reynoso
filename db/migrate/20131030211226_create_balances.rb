class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.date :balance_date
      t.decimal :size, :precision => 8, :scale => 2
      t.text :description
      t.integer :kind_of_movm, :default => 1
      t.timestamps
    end
  end
end
