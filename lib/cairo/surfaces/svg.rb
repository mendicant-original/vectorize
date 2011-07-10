module Cairo
  class Surface
    # SVG surfaces
    attach_function :cairo_svg_surface_create, [:string, :double, :double], :pointer
  end
end
