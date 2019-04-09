require "json"
require "net/http"

module Actions
  class Issue
    def initialize(issue_json)
      @json = issue_json
    end

    def labels
      @json["labels"].map {|l| l["name"] }
    end

    def number
      @json["number"]
    end

    def title
      @json["title"]
    end

    def comment(message)
      post_request("comments", { body: message })
    end

    def close!
      patch_request(nil, { state: "closed" })
    end

    private

    def post_request(path, data, header = {})
      request(header) do |conn, base_path, header|
        conn.post([base_path, path].compact.join("/"), data.to_json, header)
      end
    end

    def patch_request(path, data, header = {})
      request(header) do |conn, base_path, header|
        conn.patch([base_path, path].compact.join("/"), data.to_json, header)
      end
    end

    def request(header = {})
      header[:Authorization] = "token #{ENV["GITHUB_TOKEN"]}"
      uri                    = URI.parse(@json["url"])

      Net::HTTP.start(uri.host, uri.port, { use_ssl: true }) do |connection|
        connection.finish if connection.started?
        yield(connection, uri.path, header)
      end
    end
  end
end
