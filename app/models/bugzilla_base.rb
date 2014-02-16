class BugzillaBase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "bugzilla_#{Rails.env}"
end