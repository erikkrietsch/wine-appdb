class AddPasswordHashToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :password_hash
      t.string :password_salt
      t.remove :password
    end
  end

  def self.down
    change_table :users do |t|
      t.string :password
      t.remove :password_salt, :password_hash
    end
  end
end
