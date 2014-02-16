class Bug < BugzillaBase
  self.table_name = "bugs"
  has_one :bug_report
end
