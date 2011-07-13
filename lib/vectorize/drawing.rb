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
    
    def initialize(surface)
      @surface  = surface
      
      @path     = Path.new(@surface.context)
      add_object_methods(@path)
    
    end

    # Surfaces
    def save_as_png(filename)
      @surface.write_to_png(filename)
    end

    private
    
    # Why retype method names? And yes, I do want all of them.
    def add_object_methods(object)
      object.public_methods(false).each do |method_name|
        self.class.class_eval do
          if object.method(method_name).arity > 0 
            define_method method_name do |argument_hash|
              object.send method_name, argument_hash
            end
          else
            define_method method_name do 
              object.send method_name
            end
          end
        end
      end
    end

  end

end
