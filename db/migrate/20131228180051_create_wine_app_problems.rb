class CreateWineAppProblems < ActiveRecord::Migration
  def change
    create_table :wine_app_problems do |t|
      t.string :versions
      t.references :wine_app
      t.references :bug_report
      t.timestamps
    end
  end
end
