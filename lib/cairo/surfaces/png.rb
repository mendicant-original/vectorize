module Cairo
  class Surfaces
    # PNG surfaces
    attach_function :cairo_image_surface_create_from_png, [:string], :pointer
    attach_function :cairo_surface_write_to_png, [:pointer, :string], :uint8
  end
end
