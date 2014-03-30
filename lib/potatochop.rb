require 'potatochop/version'
require 'sinatra/base'
require 'haml'
require 'sass'

module Potatochop
  class Web < Sinatra::Base
    get '/*.html' do
      file_path = File.join(settings.working_dir, "#{params[:splat][0]}.html")
      # Static html first
      if File.exists? file_path
        send_file file_path
      # Haml next
      elsif File.exists? file_path + ".haml"
        Haml::Engine.new(File.read("#{file_path}.haml")).render
      else
        404
      end
    end
    
    get '/*.css' do
      file_path = File.join(settings.working_dir, "#{params[:splat][0]}.css")
      if File.exists? file_path
        content_type 'text/css', :charset => 'utf-8'
        send_file file_path
      elsif File.exists? file_path + '.scss'
        content_type 'text/css', :charset => 'utf-8'
        Sass::Engine.new(File.read("#{file_path}.scss"), :syntax => :scss).render
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
