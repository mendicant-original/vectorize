module Cairo
  module FFI
    extend FFI::Library
    # this will be dynamically set - using magical programming skills
    ffi_lib "/usr/X11/lib/libcairo.dylib"
  end
end
