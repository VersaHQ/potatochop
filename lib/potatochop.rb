require 'potatochop/version'
require 'potatochop/spud'
require 'potatochop/file_system_interface'
require 'potatochop/configuration'
require 'potatochop/web'
require 'haml'
require 'sass'

module Potatochop
  def self.start_up(args)
    config = Configuration.process(args)
    # Potatochop::Spud.new(config[:interface])
    Potatochop::Web.run!(:tater => Potatochop::Spud.new(config[:interface]))
  end
end
