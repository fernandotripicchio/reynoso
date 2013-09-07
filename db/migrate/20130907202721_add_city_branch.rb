class AddCityBranch < ActiveRecord::Migration
  def up
     add_column :branches, :city, :string
  end

  def down
  end
end
