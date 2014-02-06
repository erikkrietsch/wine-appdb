class CreateWineAppCategories < ActiveRecord::Migration
  def change
    create_table :wine_app_categories do |t|
      t.string :name
      t.references :wine_app_categories, null: true
      t.timestamps
    end
  end
end
