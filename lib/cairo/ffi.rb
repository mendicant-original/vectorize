module Cairo

  # Allow a simpler way to add the FFI::Library and isolate ffi_lib loading to one method
  module FFI

    def self.extended(base)
      base.extend ::FFI::Library
      # this will be dynamically set - using magical programming skills
      base.ffi_lib "/usr/X11/lib/libcairo.dylib"
    end


    def find_lib(name)
      # prefer the homebrew version over others
      if Dir.exist?("/usr/local/cellar/cairo")
        Dir["/usr/local/cellar/cairo"].sort
      end

      # no homebrew so look through the user's paths till we find it

    end

    # remove redundancy from cairo method names
    def clean_method_names
      name_parts = self.name.downcase.split "::"
      self.public_methods(false).each do |meth_symbol|
        meth_name = meth_symbol.to_s
        if name_parts.any? { |part| meth_name.include? part }
          name_parts.each{ |part| meth_name.gsub! part, '' }
          trim!(meth_name, "_")
          while meth_name.gsub!("__", "_");end
          singleton_class.send :alias_method, method_name.to_sym, method_symbol
        end
      end
    end
    
    private

    # remove leading and trailing characters from a string (in place)
    # could be augmented with non-destructive and ltrim/rtrim
    def trim!(text, chars, sides=[:left,:right])
      sides.each do |side|
        text.reverse! if side == :left
        while chars.include? text[-1]
          chars.each_char {|char| text.chomp!(char)} 
        end
        text.reverse! if side == :left
      end
    end
    
  end

end
