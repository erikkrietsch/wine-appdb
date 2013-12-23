class CreateBugReports < ActiveRecord::Migration
  def change
    create_table :bug_reports do |t|
      t.integer :refid
      t.string :title
      t.string :description
      t.string :status
      t.string :resolution

      t.timestamps
    end
  end
end
