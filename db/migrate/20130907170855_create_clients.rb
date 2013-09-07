class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, :null => false
      t.string :phone
      t.string :address
      t.string :email
      t.string :province
      t.string :zip_code
      t.text :comments
      t.timestamps
    end
  end
end
