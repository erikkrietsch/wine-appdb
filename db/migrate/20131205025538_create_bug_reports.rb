class CreateBugReports < ActiveRecord::Migration
  def change
    create_table :bug_reports do |t|
      t.integer :bugzilla_bug_id

      t.timestamps
    end
  end
end
