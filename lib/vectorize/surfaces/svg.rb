module Vectorize
  class Surface
    class SVG < Surface
      def initialize(filename, width_in_points, height_in_points)
        @surface_pointer = CairoWrapper.cairo_svg_surface_create(filename, width_in_points, height_in_points)
      end
    end
  end
end
