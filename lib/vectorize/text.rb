require "forwardable"

module Vectorize

  class Text

    def initialize(context)
      @context = context
    end
    
    def write(string, params={})
      at = params.fetch(:upper_left, Point.new(0, 0))
      set_font(params[:font], params) if params[:font]
      set_font_size(params[:size]) if params[:size]
      Cairo.move_to(@context, at.x, at.y)
      Cairo.show_text(@context, string)
    end

    def set_font(font, params={})
      Cairo.select_font_face(
        @context, 
        font,
        params.fetch(:slant, :NORMAL)
        params.fetch(:weight, :NORMAL)
      )
    end

    def set_font_size(size)
      Cairo.set_font_size(@context, size)
    end
  end
end