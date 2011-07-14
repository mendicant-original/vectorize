require_relative "surfaces/image"
require_relative "surfaces/png"
require_relative "surfaces/svg"
require_relative "surfaces/pdf"

module Vectorize
  class Surface
    attr_reader :surface_pointer
    attr_reader :context_pointer

    def context
      @context_pointer ||= Cairo.create(surface_pointer)
    end

    def destroy
      Cairo.destroy(@context_pointer) if @context_pointer
      Cairo.surface_destroy(@surface_pointer) if @surface_pointer

      @surface_pointer = @context_pointer = nil
    end

    def write_to_png(filename)
      Cairo.surface_write_to_png(@surface_pointer, filename)
    end
  end
end
