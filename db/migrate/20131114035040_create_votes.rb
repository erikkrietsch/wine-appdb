class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, null: false
      t.references :wine_app, null: false
      t.timestamps
    end
  end
end
