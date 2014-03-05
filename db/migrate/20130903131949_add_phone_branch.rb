class AddPhoneBranch < ActiveRecord::Migration
  def up
      add_column :branches, :phone, :string
  end

  def down
  end
end
