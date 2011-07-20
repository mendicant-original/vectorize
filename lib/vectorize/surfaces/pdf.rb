module Vectorize
  class Surface
    class PDF < Surface
      
      def initialize(filename, width_in_points, height_in_points)
        @surface_pointer = 
          Cairo.pdf_surface_create(filename, width_in_points, height_in_points)
      end

      def destroy
        Cairo.show_page(context)
        super
      end
      
    end
  end
end
