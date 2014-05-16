require 'digest/sha1'

FactoryGirl.define do

  factory :bug do
  end

  factory :bug_report do
    # bug
  end

  factory :vote do
    quality_value { rand(100) + 1 }
    difficulty_value { rand(100) + 1 }
    # type { ["quality", "ease" ].sample } 
    ip_address "192.168.0.0"
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
    password "password"

    factory :user_with_votes do
      after(:build) do |user, evaluator|
        user.votes = FactoryGirl.build_list(:vote, evaluator.vote_count)
        user.screenshots = FactoryGirl.build_list(:screenshot, evaluator.ss_count)
      end
    end
  end

  factory :screenshot do
    url "http://appdb.winehq.org/appimage.php?iId=38176"
    title "fun stuff!"
    association :wine_app, strategy: :build
    association :user, strategy: :build
  end

  factory :wiki_entry do
    content { ["what", "yes", "perhaps", "nope"].sample }
    association :user, strategy: :build
  end

  factory :wiki_problem, class: WikiEntry do
    content { ["who", "what", "when", "where", "how many"].sample }
    wiki_type "problem"
  end

  factory :wiki_workaround, class: WikiEntry do
    content { ["why", "when", "intent", "desire", "motive"].sample }
    wiki_type "workaround"
  end

  factory :wiki_desc, class: WikiEntry do
    content { ["desc1", "desc2", "desc3", "desc4", "one more desc"].sample }
    wiki_type "description"
  end

  factory :wiki_install_instruction, class: WikiEntry do
    content { ["inst1", "inst2", "inst3", "inst4", "one more inst"].sample }
    wiki_type "install_instruction"
  end

  factory :wiki_wine_instruction, class: WikiEntry do
    content { ["wine1", "wine2", "wine3", "wine4", "one more wine"].sample }
    wiki_type "wine_instruction"
  end

  factory :wine_version do
    WineVersion.most_recent
  end

  factory :wine_app_problem do
    ignore do
      prob_count 5
      workaround_count 3
    end
    # association :wine_app
    bug_report
    wine_version WineVersion.most_recent
    after(:build) do |problem, evaluator|
      problem.wiki_entries = FactoryGirl.build_list(:wiki_problem, evaluator.prob_count)
      problem.wiki_entries << FactoryGirl.build_list(:wiki_workaround, evaluator.workaround_count)
    end
  end

  factory :developer do
    name "Jazzy Pants Games"
    description "Creators of such incredible titles as: Jazz in your Pants, Jazz on your Hands, and Spunkwagon."
    url "http://www.jazzygames.com"
    logo nil #"http://www.whatever.com/image/what.jpg"
  end


  factory :wine_app do
    ignore do
      desc_count 5
      inst_count 4
      wine_count 6
      problem_count 15
    end
    name "TestApp1"
    after(:build) do |wine_app, evaluator|
      wine_app.wiki_entries << FactoryGirl.build_list(:wiki_desc, evaluator.desc_count)
      wine_app.wiki_entries << FactoryGirl.build_list(:wiki_install_instruction, evaluator.inst_count)
      wine_app.wiki_entries << FactoryGirl.build_list(:wiki_wine_instruction, evaluator.wine_count)
      wine_app.problems << FactoryGirl.build_list(:wine_app_problem, evaluator.problem_count)
    end
    # association :developer
    
  end




#
end

