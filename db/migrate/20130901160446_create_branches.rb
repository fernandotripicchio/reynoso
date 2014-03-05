class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string  :name
      t.boolean :active
      t.string  :email
      t.string  :address
      t.timestamps
    end
  end
end
