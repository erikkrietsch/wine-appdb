class BugReport < ActiveRecord::Base
  has_many :wine_apps, through: :wine_app_problems
  has_one :bug
end
