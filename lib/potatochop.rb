require 'potatochop/version'
require 'sinatra/base'

module Potatochop
  class Web < Sinatra::Base
    get '/' do
      "Hello worldz."
    end
  end
end
