class CreateAccountLogs < ActiveRecord::Migration
  def change
    create_table :account_logs do |t|
      t.integer :account_id
      t.date :log_date
      t.decimal :value, :precision => 8, :scale => 2
      t.string :user
      t.boolean :in, :default => true
      t.timestamps
    end
  end
end
