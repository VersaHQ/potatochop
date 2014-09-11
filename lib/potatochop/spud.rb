module Potatochop
  class Spud
    def initialize(interface)
      @interface = interface
    end

    def get_file(file_name)
      @interface.exists?(file_name) ? @interface.read(file_name) : nil
    end

    def get_html(file_name)
      if @interface.exists?("#{file_name}.html") # Static html first
        @interface.read("#{file_name}.html")
      elsif @interface.exists?("#{file_name}.html.haml") # Haml next
        Haml::Engine.new(@interface.read("#{file_name}.html.haml")).render
      end
    end

    def get_css(file_name)
      if @interface.exists?("#{file_name}.css")  # Static css
        @interface.read("#{file_name}.css")
      elsif @interface.exists?("#{file_name}.css.scss") # Sass css
        Sass::Engine.new(@interface.read("#{file_name}.css.scss"), :syntax => :scss, :load_paths => [@interface.source]).render
      end
    end
  end
end
