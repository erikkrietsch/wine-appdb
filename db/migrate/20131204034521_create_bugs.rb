class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.integer :reference_id, null: false
      t.string :title
      

      t.timestamps
    end

    add_index :bugs, :reference_id
  end
end
