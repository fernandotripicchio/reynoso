class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :expense_date
      t.decimal :size, :precision => 8, :scale => 2
      t.text :description
      t.timestamps
    end
  end
end
