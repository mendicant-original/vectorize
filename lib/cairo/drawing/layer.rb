module Cairo

  class Layer
    extend FFI

    attach_function :cairo_create, 
                    [:pointer], 
                    :pointer

    attach_function :cairo_destroy, 
                    [:pointer], 
                    :void
    
    clean_method_names
  end

end
