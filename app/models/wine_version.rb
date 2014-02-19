class WineVersion < BugzillaBase
  self.table_name = "versions"
  def WineVersion.all
    super.where(product_id: 1)
  end

  def WineVersion.recent
    self.all.order(id: :desc).limit(5)
  end
end
