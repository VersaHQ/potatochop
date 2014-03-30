require 'potatochop/version'
require 'sinatra/base'
require 'haml'
require 'sass'

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
    
    get '/*.css' do
      file_path = File.join(settings.working_dir, "#{params[:splat][0]}.css.scss")
      if File.exists? file_path
        content_type 'text/css', :charset => 'utf-8'
        Sass::Engine.new(File.read(file_path), :syntax => :scss).render
      else
        404
      end
    end
    
    get %r{/(.*).(png|jpg|jpeg|gif)} do
      # puts "params = #{params.to_json}"
      file_path = File.join(settings.working_dir, "#{params[:captures][0]}.#{params[:captures][1]}")
      if File.exists? file_path
        send_file file_path
      else
        404
      end
    end
    
  end
end
