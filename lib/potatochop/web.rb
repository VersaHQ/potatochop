require 'sinatra/base'

module Potatochop
  class Web < Sinatra::Base
    get '/*.html' do
      return_str = settings.tater.get_html(params[:splat][0])
      return_str.nil? ? 404 : return_str
    end

    get '/*.css' do
      return_str = settings.tater.get_css(params[:splat][0])
      content_type 'text/css', :charset => 'utf-8'
      return_str.nil? ? 404 : return_str
    end

    get %r{/(.*).(png|jpg|jpeg|gif)} do
      image_file = settings.tater.get_file("#{params[:captures][0]}.#{params[:captures][1]}")
      if image_file.nil?
        404
      else
        content_type "image/#{params[:captures].last}"
        image_file
      end
    end

    get '/*.js' do
      js_file = settings.tater.get_file("#{params[:splat][0]}.js")
      if js_file.nil?
        404
      else
        content_type "application/javascript", :charset => 'utf-8'
        js_file
      end
    end
  end
end
