module Vectorize
  # Example usage:
  # Vectorize.draw(200, 200) do |v|
  #   v.move_to(100, 100)
  #   v.line_to(175, 175)
  #   v.stroke
  #
  #   v.save_as_png "foo.png"
  # end
  def self.draw(width, height)
    surface = Surface::Image.new(width, height)
    dsl     = DSL.new(surface)

    begin
      yield dsl
    ensure
      surface.destroy
    end
  end

  class DSL
    def initialize(surface)
      @surface = surface
    end

    def move_to(x, y)
      Cairo.cairo_move_to(@surface.context, x, y)
    end

    def line_to(x, y)
      Cairo.cairo_line_to(@surface.context, x, y)
    end

    def stroke
      Cairo.cairo_stroke(@surface.context)
    end

    def save_as_png(filename)
      @surface.write_to_png(filename)
    end
  end
end
