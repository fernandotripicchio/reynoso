class AddVencimiento < ActiveRecord::Migration
  def up
    add_column :products, :due_date, :date
  end

  def down
  end
end
