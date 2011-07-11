require 'ffi'

module Vectorize
  module Cairo
    extend FFI::Library

    def self.find_lib
      lib = "lib/libcairo.dylib"
      # prefer the newest homebrew version over others
      if Dir.exist?(cellar = "/usr/local/cellar/cairo")
        newest = Dir[cellar].sort do |a,b|
          a.split(".").each_with_index do |version, index|
            compairison = (version.to_i <=> b.split(".")[index].to_i)
            return compairison unless compairison == 0
          end
          0
        end.last
        return "#{cellar}/#{newest}/#{lib}" if File.exist?("#{cellar}/#{newest}/#{lib}")
      end

      # no homebrew so look through the user's paths till we find it
      ENV["PATH"].split(":").each do |path|
        return "#{path}/../#{lib}" if File.exist?("#{path}/../#{lib}")
      end
      raise Exception, "Unable to locate Cairo library"
    end

    ffi_lib find_lib

    def self.cairo_method(method_name, arguments, return_type)
      attach_function method_name, "cairo_#{method_name}", arguments, return_type
    end

    # Surfaces
    cairo_method :surface_destroy,
      [:pointer],
      :uint8

    enum :image_format, [
      :invalid, -1,
      :argb32,
      :rgb24,
      :a8,
      :a1,
      :rgb16_565
    ]

    # SVG surfaces
    cairo_method :svg_surface_create,
      [:string, :double, :double],
      :pointer

    # PNG surfaces
    cairo_method :image_surface_create_from_png,
      [:string],
      :pointer

    cairo_method :surface_write_to_png,
      [:pointer, :string],
      :uint8

    # Image surfaces
    cairo_method :image_surface_create,
      [:image_format, :int, :int],
      :pointer


    # Contexts
    cairo_method :create,
      [:pointer],
      :pointer

    cairo_method :destroy,
      [:pointer],
      :void

    # Drawing

    # Paths
    cairo_method :new_path,
      [ :pointer ],
      :void

    cairo_method :path_destroy,
      [ :pointer ],
      :void

    cairo_method :copy_path,
      [ :pointer ],
      :pointer

    cairo_method :append_path,
      [ :pointer, :pointer ],
      :void

    cairo_method :close_path,
      [ :pointer ],
      :void

    cairo_method :move_to,
      [ :pointer, :double, :double ],
      :void

    cairo_method :rel_move_to,
      [ :pointer, :double, :double ],
      :void

    cairo_method :line_to,
      [ :pointer, :double, :double ],
      :void

    cairo_method :rel_line_to,
      [ :pointer, :double, :double ],
      :void

    cairo_method :arc,
      [ :pointer, :double, :double, :double, :double, :double ],
      :void

    cairo_method :arc_negative,
      [ :pointer, :double, :double, :double, :double, :double ],
      :void

    cairo_method :curve_to,
      [ :pointer, :double, :double, :double, :double, :double, :double ],
      :void

    cairo_method :rel_curve_to,
      [ :pointer, :double, :double, :double, :double, :double, :double ],
      :void

    cairo_method :rectangle,
      [ :pointer, :double, :double, :double, :double ],
      :void

    cairo_method :text_path,
      [ :pointer, :string ],
      :void

  end
end
