class AddReciboPresupuestoMov < ActiveRecord::Migration
  def up
    add_column :account_logs, :recibo, :string
  end

  def down
  end
end
