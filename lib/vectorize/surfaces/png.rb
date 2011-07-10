module Vectorize
  module Surfaces
    class PNG < Surface
      def initialize(filename)
        @surface_pointer = CairoWrapper.cairo_image_surface_create_from_png(filename)
      end
    end
  end
end
