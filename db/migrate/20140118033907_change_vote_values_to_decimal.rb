class ChangeVoteValuesToDecimal < ActiveRecord::Migration
  def up
    change_table(:votes) do |t|
      t.remove :quality_value
      t.remove :difficulty_value

      t.decimal :quality_value
      t.decimal :difficulty_value
    end
  end

  def down 
    change_table(:votes) do |t| 
      t.remove :quality_value
      t.remove :difficulty_value

      t.integer :quality_value
      t.integer :difficulty_value
    end
  end
end
