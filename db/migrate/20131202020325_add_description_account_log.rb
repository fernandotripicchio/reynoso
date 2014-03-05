class AddDescriptionAccountLog < ActiveRecord::Migration
  def up
     add_column :account_logs, :description, :text
  end

  def down
  end
end
