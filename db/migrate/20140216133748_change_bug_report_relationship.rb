class ChangeBugReportRelationship < ActiveRecord::Migration
  def up
    change_table(:bug_reports) do |t|
      t.remove :bugzilla_bug_id
      t.references :bug
    end
  end

  def down
    change_table(:bug_reports) do |t|
      t.integer :bugzilla_bug_id
      t.remove :bug_id
    end
  end
end
