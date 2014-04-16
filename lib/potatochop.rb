require 'potatochop/version'
require 'potatochop/spud'
require 'potatochop/file_system_interface'
require 'potatochop/github_interface'
require 'potatochop/cli_parser'
require 'potatochop/web'
require 'haml'
require 'sass'
require 'octokit'

module Potatochop
  def self.start_up(args)
    options = Potatochop::CliParser.parse(args)
    Potatochop::Web.run!(:tater => Potatochop::Spud.new(options[:interface]))
  end
end
