require "forwardable"

module Vectorize
  # Example usages:
  #
  # # Starting from scratch and saving to foo.png
  # Vectorize.draw(basename: "foo", formats: [:png], width: 200, height: 200) do |v|
  #   v.move_to x:  20, y:  20
  #   v.line_to x: 175, y: 175
  #   v.stroke
  # end
  #
  # # Modifying an existing PNG image
  # Vectorize.draw(source: "/tmp/foo.png", basename: "new_foo", formats: [:png]) do |v|
  #   # ...
  # end
  #
  # # Saving as a PDF
  # Vectorize.draw(basename: "foo", formats: [:pdf], width: 200, height: 200) do |v|
  #   # ...
  # end
  def self.draw(options)
    raise ArgumentError, "must specify a basename and an array of formats to save" unless options[:basename] and options[:formats]

    if options[:source]
      surface = Surface::PNG.new(options[:source])
    elsif options[:formats].include?(:pdf)
      raise ArgumentError, "must specify a width and height for PDF output" unless options[:width] and options[:height]
      surface = Surface::PDF.new(generate_filename(options[:basename], :pdf), options[:width], options[:height])
    else
      raise ArgumentError, "must specify a width and height for new images" unless options[:width] and options[:height]
      surface = Surface::Image.new(options[:width], options[:height])
    end

    drawing = Drawing.new(surface)
    begin
      yield drawing

      if options[:formats].include?(:png)
        surface.write_to_png(generate_filename(options[:basename], :png))
      end
    ensure
      surface.destroy
    end
  end

  def self.generate_filename(basename, format)
    "#{basename}.#{format}"
  end

  class Drawing
    extend Forwardable

    def_delegators :@path, *Path.instance_methods(false)

    def initialize(surface)
      @surface  = surface
      @path     = Path.new(@surface.context)
    end
  end
end
