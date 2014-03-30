require 'potatochop/version'
require 'sinatra/base'
require 'haml'

module Potatochop
  class Web < Sinatra::Base
    get '/*.html' do
      file_path = File.join(settings.working_dir, "#{params[:splat][0]}.html.haml")
      if File.exists? file_path
        Haml::Engine.new(File.read(file_path)).render
      else
        404
      end
    end
  end
end
