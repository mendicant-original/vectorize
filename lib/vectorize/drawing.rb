require "forwardable"

module Vectorize

  class Drawing
    extend Forwardable

    def_delegators :@path, *Path.instance_methods(false)

    def initialize(surface)
      @surface  = surface
      @path     = Path.new(@surface.context)
    end
    
  end
  
end