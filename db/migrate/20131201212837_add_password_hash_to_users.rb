class AddPasswordHashToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :password_hash
      t.string :password_salt
      t.remove :password
    end
  end
end
