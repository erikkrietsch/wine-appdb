class BugReport < ActiveRecord::Base
  has_many :wine_apps, through: :wine_app_problems
  belongs_to :bug
end
