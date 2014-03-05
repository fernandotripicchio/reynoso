class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :observation
      t.timestamps
    end
    
    add_column :products, :laboratory_id, :integer
  end
end
