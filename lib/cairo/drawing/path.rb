module Cairo
  class Drawing
    class Path
      extend FFI

      attach_function :cairo_new_path,        
                      [ :pointer ], 
                      :void
                      
      attach_function :cairo_path_destroy,    
                      [ :pointer ], 
                      :void
      
      attach_function :cairo_copy_path,       
                      [ :pointer ], 
                      :pointer
                      
      attach_function :cairo_append_path,     
                      [ :pointer, :pointer ], 
                      :void

      attach_function :cairo_close_path,
                      [ :pointer ], 
                      :void

      attach_function :cairo_move_to,
                      [ :pointer, :double, :double ], 
                      :void
                      
      attach_function :cairo_rel_move_to,
                      [ :pointer, :double, :double ], 
                      :void

      attach_function :cairo_line_to,
                      [ :pointer, :double, :double ], 
                      :void
                      
      attach_function :cairo_rel_line_to,
                      [ :pointer, :double, :double ], 
                      :void

      attach_function :cairo_arc,
                      [ :pointer, :double, :double, :double, :double, :double ],
                      :void
                      
      attach_function :cairo_arc_negative,
                      [ :pointer, :double, :double, :double, :double, :double ],
                      :void

      attach_function :cairo_curve_to,
                      [ :pointer, :double, :double, :double, :double, :double, :double ],
                      :void
                      
      attach_function :cairo_rel_curve_to, 
                      [ :pointer, :double, :double, :double, :double, :double, :double ],
                      :void

      attach_function :cairo_rectangle,
                      [ :pointer, :double, :double, :double, :double ],
                      :void

      attach_function :cairo_text_path,
                      [ :pointer, :string ], 
                      :void

    end
  end
end
