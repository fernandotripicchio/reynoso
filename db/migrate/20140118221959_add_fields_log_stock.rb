class AddFieldsLogStock < ActiveRecord::Migration
  def up
      add_column :stock_logs, :user_id, :integer
      add_column :stock_logs, :size, :integer
      add_column :stock_logs, :description, :text
  end

  def down
  end
end
