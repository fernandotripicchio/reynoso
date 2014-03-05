class AddInitialStock < ActiveRecord::Migration
  def up
     add_column :stocks, :initial_stock, :integer
  end

  def down
  end
end
