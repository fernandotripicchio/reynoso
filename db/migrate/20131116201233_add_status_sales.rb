class AddStatusSales < ActiveRecord::Migration
  def up
     add_column :sales, :status, :boolean, :default => true
  end

  def down
  end
end
