module Potatochop
  class GithubInterface
    attr_reader :source

    def initialize(repo, gh_options = {})
      @source = repo
      @gh_client = Octokit::Client.new access_token: gh_options[:access_token]
    end
    
    def exists?(file_name)
      begin
        @gh_client.contents(@source, path: file_name, accept: 'application/vnd.github.raw')
        true
      rescue Octokit::NotFound
        false
      end
    end
    
    def read(file_name)
      @gh_client.contents(@source, path: file_name, accept: 'application/vnd.github.raw')
    end
  end
end