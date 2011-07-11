module Cairo

  # Allow a simpler way to add the FFI::Library and isolate ffi_lib loading to one method
  module FFI
    
    def self.extended(base)
      base.extend ::FFI::Library
      # this will be dynamically set - using magical programming skills
      base.ffi_lib "/usr/X11/lib/libcairo.dylib"
    end
    
    def clean_method_name
      name_parts = self.name.downcase.split "::"
      self.public_methods(false).each do |meth_symbol|
        meth_name = meth_symbol.to_s
        if name_parts.any? { |part| meth_name.include? part }
          name_parts.each{ |part| meth_name.gsub! part, '' }
          #puts "new_name: #{meth_name}"
        end
      end
      
    end
    
  end

end
