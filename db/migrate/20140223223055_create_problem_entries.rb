class CreateProblemEntries < ActiveRecord::Migration
  def change
    create_table :problem_entries do |t|

      t.timestamps
    end
  end
end
