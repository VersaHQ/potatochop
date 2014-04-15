module Potatochop
  class Configuration
    def self.process(args)
      wd = args[0] || '.'
      return {
        :interface => Potatochop::FileSystemInterface.new(wd)
      }
    end
  end
end