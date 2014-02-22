class AddFacturaPresupuesto < ActiveRecord::Migration
  def up
     add_column :sales, :factura_presupuesto, :string
     add_column :sales, :tipo_presupuesto, :string
  end

  def down
  end
end
