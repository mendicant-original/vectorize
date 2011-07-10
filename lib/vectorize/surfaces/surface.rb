module Vectorize
  module Surfaces
    class Surface
      attr_reader :surface_pointer
      attr_reader :context_pointer

      def context
        @context_pointer ||= CairoWrapper.cairo_create(surface_pointer)
      end
    end
  end
end
