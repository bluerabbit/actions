require "octokit"

client     = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
current_pr = client.pull_request(ENV["GITHUB_REPOSITORY"], ENV["PULL_REQUEST_NUMBER"])

prs = client.pull_requests(ENV["GITHUB_REPOSITORY"], query: { ref: current_pr.base.ref })

if parent_pr = prs.detect {|pr| pr.head.ref == current_pr.base.ref }
  client.update_pull_request(ENV["GITHUB_REPOSITORY"],
                             ENV["PULL_REQUEST_NUMBER"],
                             body: "#{current_pr.body}\n\n## Base Branch\n\n- #{current_pr.base.ref} ##{parent_pr.number}")
end
