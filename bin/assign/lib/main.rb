$LOAD_PATH << File.dirname(__FILE__)

require 'json'
require 'octokit'

client     = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
event_json = JSON.parse(File.read(ENV["GITHUB_EVENT_PATH"]))

exit 78 unless event_json["action"] == "opened"

begin
  pr = event_json["pull_request"]
  client.add_assignees(event_json["repository"]["full_name"],
                       pr["number"],
                       [pr["user"]["login"]])
rescue => ex
  puts ex.message
  exit 1 # github actions status is failure
end
