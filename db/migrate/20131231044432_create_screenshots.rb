class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.references :wine_app
      t.references :user
      
      t.timestamps
    end
    add_attachment :screenshots, :image
  end
end
