require "forwardable"

module Vectorize

  class Text

    def initialize(context)
      @context = context
    end
    
    def write(string, options={})
      at = options[:upper_right] || Point.new(0, 0)
      set_font(options[:font], options) if options[:font]
      set_font_size(options[:size]) if options[:size]
      Cairo.move_to(@context, at.x, at.y)
      Cairo.show_text(@context, string)
    end

    def set_font(font, options={})
      Cairo.select_font_face(
        @context, 
        font,
        options[:slant] || :NORMAL,
        options[:weight] || :NORMAL
      )
    end

    def set_font_size(size)
      Cairo.set_font_size(@context, size)
    end
  end
end