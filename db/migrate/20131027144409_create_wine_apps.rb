class CreateWineApps < ActiveRecord::Migration
  def change
    create_table :wine_apps do |t|
      t.string :name, :index => true
      t.string :description
    end
    add_index :wine_apps, :name
  end
end
