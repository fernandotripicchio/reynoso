class AddFieldsSales < ActiveRecord::Migration
  def up
     add_column :sales, :comments, :text
     add_column :sales, :payment, :string
     
  end

  def down
  end
end
