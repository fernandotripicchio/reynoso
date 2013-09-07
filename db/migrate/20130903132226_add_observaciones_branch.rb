class AddObservacionesBranch < ActiveRecord::Migration
  def up
    add_column :branches, :comments, :string
  end

  def down
  end
end
