module Potatochop
  class Spud
    def initialize(source)
      @source = source
    end
    
    def get_html(file_name)
      file_path = File.join(@source, "#{file_name}.html")
      
      # Static html first
      if File.exists? file_path
        #send_file file_path
        File.read(file_path)
      # Haml next
      elsif File.exists? file_path + ".haml"
        Haml::Engine.new(File.read("#{file_path}.haml")).render
      end
    end
    
    def get_css(file_name)
      file_path = File.join(@source, "#{file_name}.css")
      if File.exists? file_path
        File.read(file_path)
      elsif File.exists? file_path + '.scss'
        Sass::Engine.new(File.read("#{file_path}.scss"), :syntax => :scss).render
      end
    end
  end
end