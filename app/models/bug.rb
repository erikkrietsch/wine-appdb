class Bug < BugzillaBase
  self.table_name = "bugs"
  has_one :bug_report
  def description
    return self.short_desc    
  end
end
