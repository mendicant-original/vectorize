module Vectorize
  class CairoWrapper
    extend FFI::Library
    # TODO: How to make this portable?
    ffi_lib "/usr/X11/lib/libcairo.dylib"

    # Surfaces
    attach_function :cairo_create, [:pointer], :pointer
    attach_function :cairo_destroy, [:pointer], :void
    attach_function :cairo_surface_destroy, [:pointer], :uint8
    CAIRO_FORMAT_INVALID   = -1
    CAIRO_FORMAT_ARGB32    = 0
    CAIRO_FORMAT_RGB24     = 1
    CAIRO_FORMAT_A8        = 2
    CAIRO_FORMAT_A1        = 3
    CAIRO_FORMAT_RGB16_565 = 4

    # Image surfaces
    attach_function :cairo_image_surface_create, [:uint8, :int, :int], :pointer

    # PNG surfaces
    attach_function :cairo_image_surface_create_from_png, [:string], :pointer
    attach_function :cairo_surface_write_to_png, [:pointer, :string], :uint8

    # SVG surfaces
    attach_function :cairo_svg_surface_create, [:string, :double, :double], :pointer
  end
end
