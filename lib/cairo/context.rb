module Cairo

  class Context
    extend FFI

    attach_function :cairo_create, [:pointer], :pointer
    attach_function :cairo_destroy, [:pointer], :void

    # Can we alias the attached functions?
    # If so it could be metaprogram-ized by adding 
    # some helper method call to the calls like
    # alias_trim "cairo_"
    alias_method :create, :cairo_create
    alias_method :destroy, :cairo_destroy

  end

end
