class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, :index => true
      t.string :token, :index => true
      t.string :password

      t.timestamps
    end
  end
end
