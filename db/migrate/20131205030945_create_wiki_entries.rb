class CreateWikiEntries < ActiveRecord::Migration
  def change
    create_table :wiki_entries do |t|
      t.references :wikiable, :polymorphic => true
      t.references :user
      t.text :content
      t.timestamps
    end
  end
end
