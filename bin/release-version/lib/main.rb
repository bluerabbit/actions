$LOAD_PATH << File.dirname(__FILE__)

require "json"
require "octokit"

event_json = JSON.parse(File.read(ENV["GITHUB_EVENT_PATH"]))
comment    = event_json["comment"]
body       = comment["body"].to_s.strip

if body.include? "/version"
  old_version = File.read('.version').strip
  new_version = body[("/version".size + 1)..]

  File.write(".version", "#{new_version}\n")

  client    = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  pr_number = event_json["issue"]["number"]
  pr        = client.pull_request(ENV["GITHUB_REPOSITORY"], pr_number)

  # 本文とタイトルのバージョンを書き換える
  client.update_pull_request(ENV["GITHUB_REPOSITORY"],
                             pr_number,
                             title: "Release #{new_version} by @#{ENV["GITHUB_ACTOR"]}",
                             body:  pr.body.gsub(old_version, new_version))

  pull_request_branch_name = pr.head.ref

  `git remote set-url origin https://#{ENV["GITHUB_ACTOR"]}:#{ENV["GITHUB_TOKEN"]}@github.com/#{ENV["GITHUB_REPOSITORY"]}`
  `git checkout #{pull_request_branch_name}`
  `git add .version`
  `git commit -m ":tada: Release #{new_version} [ci skip]"`
  `git push origin #{pull_request_branch_name}`
end
