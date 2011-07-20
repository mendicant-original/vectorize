module Vectorize

  def self.draw(options)
    raise ArgumentError, 
      "must specify a basename and an array of formats to save" unless
      options[:basename] and options[:formats]
    
    surface = make_surface(options)

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
  
  private 

  def self.generate_filename(basename, format)
    "#{basename}.#{format}"
  end
  
  def self.make_surface(options)
    
    if options[:source]
      Surface::PNG.new(options[:source])
    elsif options[:formats].include?(:pdf)
      raise ArgumentError, 
        "must specify a width and height for PDF output" unless
          options[:width] and options[:height]
          
      Surface::PDF.new(
        generate_filename(options[:basename], :pdf), 
        options[:width], 
        options[:height]
      )
    else
      
      raise ArgumentError, 
        "must specify a width and height for new images" unless 
          options[:width] and options[:height]
          
      Surface::Image.new(options[:width], options[:height])
    end
  end
  
end