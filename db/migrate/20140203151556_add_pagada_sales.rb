class AddPagadaSales < ActiveRecord::Migration
  def up
     add_column :sales, :pagada, :boolean, :defaul => false
  end

  def down
  end
end
