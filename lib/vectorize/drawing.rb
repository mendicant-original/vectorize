require "forwardable"

module Vectorize
  # Example usage:
  # Vectorize.draw(width: 200, height: 200) do |v|
  #   v.move_to x:  20, y:  20
  #   v.line_to x: 175, y: 175
  #   v.stroke
  #
  #   v.save_as_png "foo.png"
  # end
  #
  # Vectorize.draw(from_png: "/tmp/foo.png") do |v|
  #   # ...
  # end
  def self.draw(options)
    if options[:width] and options[:height]
      surface = Surface::Image.new(options[:width], options[:height])
    elsif options[:from_png]
      surface = Surface::PNG.new(options[:from_png])
    else
      raise ArgumentError, "must specify :width and :height or :from_png to create drawing surface"
    end

    drawing = Drawing.new(surface)
    begin
      yield drawing
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
