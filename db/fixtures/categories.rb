def seed_category(name, parent=nil)
  WineAppCategory.seed(:name) do |c|
    c.name = name
    parent.categories << c if parent
  end
end

seed_category("Educational Software, CBT")

parent = seed_category("Games")
seed_category("1st Person Shooter")
seed_category("Action")
parent = seed_category("Adventure")
seed_category("Adult")


