class BugzillaBase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection ENV["BUGZILLA_URL"]
end