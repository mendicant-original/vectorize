module Cairo

  # Allow a simpler way to add the FFI::Library and isolate ffi_lib loading to one method
  module FFI
    def self.extended(base)
      base.extend ::FFI::Library
      # this will be dynamically set - using magical programming skills
      base.ffi_lib "/usr/X11/lib/libcairo.dylib"
    end 
  end

end
