require "forwardable"

module Vectorize
  # Example usage:
  # Vectorize.draw(200, 200) do |v|
  #   v.move_to x:  20, y:  20
  #   v.line_to x: 175, y: 175
  #   v.stroke
  #
  #   v.save_as_png "foo.png"
  # end
  def self.draw(width, height)
    surface = Surface::Image.new(width, height)
    dsl     = Drawing.new(surface)
    
    begin
      yield dsl
    ensure
      surface.destroy
    end
  end

  class Drawing
    extend Forwardable

    def_delegators :@path, *Path.instance_methods(false)

    def initialize(surface)
      @surface  = surface
      @path     = Path.new(@surface.context)
    end

    # Surfaces
    def save_as_png(filename)
      @surface.write_to_png(filename)
    end
  end
end
