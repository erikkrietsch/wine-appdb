require 'digest/sha1'

FactoryGirl.define do
  factory :wine_app do
    name "TestApp1"
    description "Test Application For Testing And Such"
  end

  factory :developer do
    name "Jazzy Pants Games"
    description "Creators of such incredible titles as: Jazz in your Pants, Jazz on your Hands, and Spunkwagon."
    url "http://www.jazzygames.com"
    logo nil #"http://www.whatever.com/image/what.jpg"
  end

  factory :vote do
    value { rand(5) + 1 }
    type { ["quality", "ease" ].sample } 
    association :user, strategy: :build
    association :wine_app, strategy: :build
  end

  factory :user do
    ignore do
      vote_count 8
      ss_count 3
    end
    name "Heinrich Q. Test-eaze"
    email "hank@testease.info"
    token "123412341234"
    password Digest::SHA1.hexdigest "password"
    after(:build) do |user, evaluator|
      # user.votes = FactoryGirl.build_list(:vote, evaluator.vote_count)
      # user.screenshots = FactoryGirl.build_list(:screenshot, evaluator.ss_count)
    end
  end

  factory :screenshot do
    url "http://appdb.winehq.org/appimage.php?iId=38176"
    title "fun stuff!"
    association :wine_app, strategy: :build
    association :user, strategy: :build
  end
#
end

