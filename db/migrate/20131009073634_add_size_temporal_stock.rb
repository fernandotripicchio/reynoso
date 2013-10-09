class AddSizeTemporalStock < ActiveRecord::Migration
  def up
     add_column :stocks , :temporal_size, :integer
  end

  def down
  end
end
