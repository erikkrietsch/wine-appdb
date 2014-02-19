class AddVersionReferenceToWineAppProblems < ActiveRecord::Migration
  def change
    change_table :wine_app_problems do |t|
      t.remove :versions
      t.references :wine_versions
    end
  end
end
