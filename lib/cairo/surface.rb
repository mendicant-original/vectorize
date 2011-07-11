module Cairo
  module Surface
    extend FFI

    # Surfaces
    attach_function :cairo_surface_destroy, [:pointer], :uint8

    # Not sure which I like better, the FFI version of enum or the constant version
    enum :cairo_format, [
      :invalid, -1,
      :argb32,
      :rgb24,
      :a8,
      :a1,
      :rgb16_565
    ] 
    
    #CAIRO_FORMAT_INVALID   = -1
    #CAIRO_FORMAT_ARGB32    = 0
    #CAIRO_FORMAT_RGB24     = 1
    #CAIRO_FORMAT_A8        = 2
    #CAIRO_FORMAT_A1        = 3
    #CAIRO_FORMAT_RGB16_565 = 4
 
    # SVG surfaces
    attach_function :cairo_svg_surface_create, [:string, :double, :double], :pointer
    
    # PNG surfaces
    attach_function :cairo_image_surface_create_from_png, [:string], :pointer
    attach_function :cairo_surface_write_to_png, [:pointer, :string], :uint8
    
    # Image surfaces
    attach_function :cairo_image_surface_create, [:uint8, :int, :int], :pointer
  
  end
end