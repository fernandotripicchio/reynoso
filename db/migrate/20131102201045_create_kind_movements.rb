class CreateKindMovements < ActiveRecord::Migration
  def change
    create_table :kind_movements do |t|
      t.string :description
      t.boolean :in, :default => true
      t.timestamps
    end
  end
end
