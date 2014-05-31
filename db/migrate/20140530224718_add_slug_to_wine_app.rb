class AddSlugToWineApp < ActiveRecord::Migration
  def change
    add_column :wine_apps, :slug, :string
    add_index :wine_apps, :slug, unique: true
  end
end
