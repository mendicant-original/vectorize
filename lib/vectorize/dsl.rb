module Vectorize
  # Example usage:
  # Vectorize.draw(200, 200) do |v|
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
      @context = surface.context
    end

    # Surfaces
    def save_as_png(filename)
      @surface.write_to_png(filename)
    end

    # Drawing

    def move_to(x, y)
      Cairo.move_to(@context, x, y)
    end

    def move_relative(x, y)
      Cairo.rel_move_to(@context, x, y)
    end

    def line_to(x, y)
      Cairo.line_to(@context, x, y)
    end

    def line_relative(x, y)
      Cairo.rel_line_to(@context, x, y)
    end

    def close_path
      Cairo.close_path(@context)
    end
    
    def stroke
      Cairo.stroke(@context)
    end

    

  end

end
