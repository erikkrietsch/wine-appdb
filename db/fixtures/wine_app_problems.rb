
def seed_problems

  problem_descriptions = ["I can't log in", "Application won't start", "Nothing responds!", "I've lost power!", "I'm mella control!", "It just keeps saying the same thing!"]
  workaround_descriptions = ["Reboot it.", "Recalibrate your samoflange.", "Refresh turbo encabulator.", "Ensure ISO 9003 standards adherence with installed driver repo.", "Flatten and reinstall."]
  reports = []
  Bug.all.order(bug_id: :desc).limit(5).each do |b|
    br = BugReport.new
    br.bug = b
    br.save
    reports << br
  end

  wine_version = WineVersion.last

  wine_app = WineApp.first
  reports.each do |br|
    problem = WineAppProblem.new
    problem.bug_report = br
    problem.wine_version = wine_version
    problem.workarounds << WikiEntry.create(content: workaround_descriptions.sample)
    problem.problems << WikiEntry.create(content: problem_descriptions.sample)
    problem.save
    wine_app.problems << problem
  end
end

seed_problems
