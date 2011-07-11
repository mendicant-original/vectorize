module Cairo
  module Surface
    extend FFI

    # Surfaces
    attach_function :cairo_surface_destroy, [:pointer], :uint8

    # Not sure which I like better, the FFI version of enum or the constant version
    enum :image_format, [
      :invalid, -1,
      :argb32,
      :rgb24,
      :a8,
      :a1,
      :rgb16_565
    ] 

    # SVG surfaces
    attach_function :cairo_svg_surface_create, [:string, :double, :double], :pointer
    
    # PNG surfaces
    attach_function :cairo_image_surface_create_from_png, [:string], :pointer
    attach_function :cairo_surface_write_to_png, [:pointer, :string], :uint8
    
    # Image surfaces
    attach_function :cairo_image_surface_create, [:image_format, :int, :int], :pointer
  
  end
end
