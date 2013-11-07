class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name, :index => true
      t.string :url
      t.string :description
      t.string :logo

      t.timestamps
    end
  end
end
