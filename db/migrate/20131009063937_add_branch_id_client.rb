class AddBranchIdClient < ActiveRecord::Migration
  def up
     add_column :clients, :branch_id, :integer
  end

  def down
  end
end
