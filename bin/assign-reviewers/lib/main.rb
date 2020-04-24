require "json"
require "octokit"

event_json = JSON.parse(File.read(ENV["GITHUB_EVENT_PATH"]))

exit 78 unless event_json["action"] == "opened"

# ランダムでアサインする
reviewers = ENV["INPUT_REVIEWERS"].split(',').shuffle[0..(ENV["INPUT_REVIEWER_COUNT"].to_i - 1)]

begin
  client = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  client.request_pull_request_review(event_json["repository"]["full_name"],
                                     event_json["pull_request"]["number"],
                                     reviewers: reviewers)
rescue => ex
  puts ex.message
  exit 1 # github actions status is failure
end
