class AddFieldsStock < ActiveRecord::Migration
  def up
    add_column :stocks, :profit, :integer
  end

  def down
  end
end
