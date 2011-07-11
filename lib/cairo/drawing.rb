module Cairo
  class Drawing
    extend FFI

    attach_function :cairo_move_to, [ :pointer, :double, :double ], :void
    attach_function :cairo_line_to, [ :pointer, :double, :double ], :void
    attach_function :cairo_stroke, [ :pointer ], :void
  
  end
end
