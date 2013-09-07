class Stock < ActiveRecord::Migration
  def up
    add_column :stocks, :kind_movement, :string, :default => "Incremento"
  end

  def down
  end
end
