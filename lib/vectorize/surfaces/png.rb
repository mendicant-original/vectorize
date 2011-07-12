module Vectorize
  class Surface
    class PNG < Surface
      def initialize(filename)
        @surface_pointer = Cairo.image_surface_create_from_png(filename)
      end
    end
  end
end
