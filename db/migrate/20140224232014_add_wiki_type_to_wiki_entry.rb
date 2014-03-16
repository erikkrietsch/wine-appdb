class AddWikiTypeToWikiEntry < ActiveRecord::Migration
  def change
    change_table :wiki_entries do |t|
      t.string :wiki_type
    end
  end
end
