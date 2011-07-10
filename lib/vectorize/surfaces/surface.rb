module Vectorize
  module Surfaces
    class Surface
      attr_reader :surface_pointer
      attr_reader :context_pointer

      def context
        @context_pointer ||= CairoWrapper.cairo_create(surface_pointer)
      end

      def destroy
        CairoWrapper.cairo_destroy(@context_pointer) if @context_pointer
        CairoWrapper.cairo_surface_destroy(@surface_pointer) if @surface_pointer

        @surface_pointer = @context_pointer = nil
      end

      def write_to_png(filename)
        CairoWrapper.cairo_surface_write_to_png(@surface_pointer, filename)
      end
    end
  end
end
