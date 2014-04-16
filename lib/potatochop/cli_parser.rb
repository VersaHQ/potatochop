require 'optparse'

module Potatochop
  class CliParser
    def self.parse(args)
      options = {
        :interface => nil,
        :interface_class => Potatochop::FileSystemInterface,
        :mockups_path => '.',
        :gh_options => {}
      }
    
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: potatochop [options]"
      
        opts.separator ""
        opts.separator "Specific options:"
      
        opts.on("-i", "--interface [INTERFACE]", "How to find the files to serve (possible options are 'local' and 'github')") do |interface|
          if interface == 'github'
            options[:interface_class] = Potatochop::GithubInterface
          end
        end

        opts.on("-d", "--mockups [PATH]", "Path to the mockups folder you want to serve") do |wd|
          options[:mockups_path] = wd
        end
      
        opts.on("--repo [GITHUB REPOSITORY]", "username/reponame on GitHub") do |repo|
          options[:mockups_path] = repo
        end
      
        opts.on("--token [GITHUB ACCESS TOKEN]", "GitHub access token (needed to access private repositories)") do |token|
          options[:gh_options][:access_token] = token
        end
      end
    
      opts.parse!(args)
      options[:interface] = options[:interface_class].send(:new, options[:mockups_path], options[:gh_options])
      options
    end
  end
end