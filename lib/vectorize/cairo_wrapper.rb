module Vectorize
  class CairoWrapper
    extend FFI::Library
    # TODO: How to make this portable?
    ffi_lib "/usr/X11/lib/libcairo.dylib"

    # Surfaces
    attach_function :cairo_create, [:pointer], :pointer
    CAIRO_FORMAT_INVALID   = -1
    CAIRO_FORMAT_ARGB32    = 0
    CAIRO_FORMAT_RGB24     = 1
    CAIRO_FORMAT_A8        = 2
    CAIRO_FORMAT_A1        = 3
    CAIRO_FORMAT_RGB16_565 = 4

    # Image surfaces
    attach_function :cairo_image_surface_create, [:uint8, :int, :int], :pointer
  end
end
