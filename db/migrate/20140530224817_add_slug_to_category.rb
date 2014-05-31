class AddSlugToCategory < ActiveRecord::Migration
  def change
    add_column :wine_app_categories, :slug, :string
    add_index :wine_app_categories, :slug, unique: true
  end
end
