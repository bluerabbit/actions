require 'json'
require 'octokit'

if ENV['GITHUB_TOKEN'].nil?
  puts 'Set the GITHUB_TOKEN env variable.'
  exit 1
end

event_json   = JSON.parse(File.read(ENV['GITHUB_EVENT_PATH']))
pull_request = event_json['pull_request']

if event_json['action'] != 'closed' && pull_request['merged'] != 'true'
  exit 78
end

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

current_branch = pull_request['head']['ref']
repo           = pull_request['head']['repo']

if current_branch == repo['default_branch']
  exit 0
end

repo_name = "#{repo['owner']['login']}/#{repo['name']}"

begin
  pull_requests = client.pull_requests(repo_name, state: 'open')

  if pull_requests.any? { |pr| pr['base']['ref'] == current_branch }
    exit 0
  end

  client.delete_branch(repo_name, current_branch)
  puts "Delete Branch #{current_branch}"
  exit 0
rescue StandardError => ex
  puts ex.message
  exit 1 # github actions status is failure
end
