$LOAD_PATH << File.dirname(__FILE__)

require "json"
require "issue"

event_json = JSON.parse(File.read(ENV["GITHUB_EVENT_PATH"]))

begin
  issue = Actions::Issue.new(event_json["issue"])
  unless event_json["action"] == "opened" && issue.labels.include?(":octocat:git-pr-release")
    exit 78 # github actions status is neutral
  end

  skip_dot_version = issue.title == "git-pr-release"
  unless skip_dot_version || match_data = issue.title.match(/(?<version>\d+\.\d+\.\d+)$/)
    issue.comment ":ng:Set release version to title `git-pr-release x.x.x`"
    exit 1 # github actions status is failure
  end

  issue.comment ":hourglass_flowing_sand:Processing..."

  # update git remote url
  system "git remote set-url origin https://${GIT_PR_RELEASE_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

  # update .version file
  # tag情報がないときはお試し用にgit-pr-releaseを実行できる
  unless skip_dot_version
    version = match_data[:version]
    system "echo #{version} > .version"
    system "git add .version"
    system "GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL git commit -m ':tada: Release #{version}'"
    system "git push origin develop"
  end

  # git-pr-release
  option_env = { "DEBUG" => "enable", "ISSUE_NUMBER" => issue.number.to_s }
  option_env["DRYRUN"] = "enable" if skip_dot_version
  system(option_env, "git-pr-release")

  issue.close!
rescue => ex
  issue.comment ":ng:#{ex.class}:#{ex.message}"
  exit 1 # github actions status is failure
end
