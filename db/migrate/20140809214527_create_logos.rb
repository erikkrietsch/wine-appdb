class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.references :wine_app
      t.references :user
      
      t.timestamps
    end
    add_attachment :logos, :image
  end
end
