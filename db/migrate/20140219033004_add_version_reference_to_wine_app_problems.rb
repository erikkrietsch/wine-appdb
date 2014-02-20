class AddVersionReferenceToWineAppProblems < ActiveRecord::Migration
  def up
    change_table :wine_app_problems do |t|
      t.remove :versions
      t.references :wine_version
    end
  end

  def down
    change_table :wine_app_problems do |t|
      t.string :versions
      t.remove :wine_version_id
    end
  end
end
