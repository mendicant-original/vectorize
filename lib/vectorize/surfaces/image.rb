module Vectorize
  module Surfaces
    class Image < Surface
      def initialize(width, height)
        @surface_pointer = CairoWrapper.cairo_image_surface_create(CairoWrapper::CAIRO_FORMAT_ARGB32, width, height)
      end
    end
  end
end
