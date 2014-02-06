class WineAppCategory < ActiveRecord::Base
  # belongs_to :parent, as: :wine_app_category
  has_many :categories, as: :wine_app_category
  has_many :wine_apps
end
