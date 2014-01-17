class RefactorVotes < ActiveRecord::Migration
  def up
    change_table(:votes) do |t|
      t.remove :value
      t.remove :vote_type
      
      t.integer :quality_value
      t.integer :difficulty_value
    end
  end

  def down 
    change_table(:votes) do |t|
      t.remove :quality_value
      t.remove :difficulty_value

      t.integer :value
      t.string :vote_type
    end
  end    
end
