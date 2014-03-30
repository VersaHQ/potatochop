unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end
require 'potatochop'
require 'rspec'
require 'rack/test'