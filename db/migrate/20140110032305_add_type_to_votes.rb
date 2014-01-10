class AddTypeToVotes < ActiveRecord::Migration
  def change
    change_table(:votes) do |t|
      t.string :vote_type
      t.string :ip_address
    end
    add_index :votes, :wine_app_id
    add_index :votes, :user_id
    add_index :votes, :ip_address
    add_index :votes, :vote_type
  end
end
