module Cairo

  class Surface
    extend FFI::Library

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

  end

end

