class WikiEntry < ActiveRecord::Base
  belongs_to :wikiable, :polymorphic => true
  belongs_to :user
end
