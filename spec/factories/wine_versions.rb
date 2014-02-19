# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wine_version do
    version "MyString"
    release_date "2014-02-18 21:29:22"
    status 1
  end
end
