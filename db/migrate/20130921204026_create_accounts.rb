class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :client_id
      t.text :comments
      t.decimal :mount,  :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
