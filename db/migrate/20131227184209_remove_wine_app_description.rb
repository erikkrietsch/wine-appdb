class RemoveWineAppDescription < ActiveRecord::Migration
  def up
    change_table(:wine_apps) do |t|
      t.remove :description      
    end
  end

  def down
    change_table(:wine_apps) do |t|
      t.string :description
    end
  end
end
