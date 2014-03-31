require 'potatochop/version'
require 'potatochop/spud'
require 'sinatra/base'
require 'haml'
require 'sass'

module Potatochop
  class Web < Sinatra::Base
    get '/*.html' do
      tater = Potatochop::Spud.new(settings.working_dir)
      return_str = tater.get_html(params[:splat][0])
      return_str.nil? ? 404 : return_str
    end

    get '/*.css' do
      tater = Potatochop::Spud.new(settings.working_dir)
      return_str = tater.get_css(params[:splat][0])
      content_type 'text/css', :charset => 'utf-8'
      return_str.nil? ? 404 : return_str
    end

    get %r{/(.*).(png|jpg|jpeg|gif)} do
      file_path = File.join(settings.working_dir, "#{params[:captures][0]}.#{params[:captures][1]}")
      File.exists? file_path ? send_file(file_path) : 404
    end

    get '/*.js' do
      file_path = File.join(settings.working_dir, "#{params[:splat][0]}.js")
      File.exists? file_path ? send_file(file_path) : 404
    end
  end
end
