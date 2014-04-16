module Potatochop
  class Configuration
    def self.process(args)
      # TODO: This should be the place where command line arguments or config
      #       files are processed. Pretty bare bones at the moment.
      wd = args[0] || '.'
      return {
        :interface => Potatochop::FileSystemInterface.new(wd)
        # :interface => Potatochop::GithubInterface.new('mertonium/potatochop_comps')
      }
    end
  end
end