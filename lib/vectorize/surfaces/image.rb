module Vectorize
  class Surface
    class Image < Surface
      def initialize(width, height)
        @surface_pointer = Cairo.image_surface_create(:ARGB32, width, height)
      end
    end
  end
end
