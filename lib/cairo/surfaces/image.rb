module Cairo
  class Surfaces
    # Image surfaces
    attach_function :cairo_image_surface_create, [:uint8, :int, :int], :pointer
  end
end

