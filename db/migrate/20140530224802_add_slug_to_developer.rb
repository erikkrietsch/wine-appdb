class AddSlugToDeveloper < ActiveRecord::Migration
  def change
    add_column :developers, :slug, :string
    add_index :developers, :slug, unique: true
  end
end
