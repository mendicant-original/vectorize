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

      # Linux?
      return "/usr/lib/libcairo.so" if File.exist?("/usr/lib/libcairo.so")

      raise Exception, "Unable to locate Cairo library"
    end

    ffi_lib find_lib

    def self.cairo_method(method_name, arguments, return_type)
      attach_function method_name, "cairo_#{method_name}", arguments, return_type
    end

    # type defs to make life easier when reading and writing these methods
    typedef :pointer,   :surface 
    typedef :pointer,   :context
    typedef :pointer,   :x_pointer
    typedef :pointer,   :y_pointer
    typedef :double,    :x
    typedef :double,    :y
    typedef :double,    :control_point_x
    typedef :double,    :control_point_y
    typedef :double,    :to_x
    typedef :double,    :to_y
    typedef :int,       :width
    typedef :int,       :height
    typedef :double,    :width_double
    typedef :double,    :height_double
    typedef :string,    :filename
    typedef :double,    :radius
    typedef :double,    :angle_start
    typedef :double,    :angle_end
    typedef :double,    :red
    typedef :double,    :green
    typedef :double,    :blue
    typedef :double,    :alpha
    
    # enums

    enum :image_format, [
      :INVALID, -1,
      :ARGB32,
      :RGB234,
      :A8,
      :A1,
      :RGB16_565
    ]

    enum :status, [
        :SUCCESS, 0,
        
        :NO_MEMORY,
        :INVALID_RESTORE,
        :INVALID_POP_GROUP,
        :NO_CURRENT_POINT,
        :INVALID_MATRIX,
        :INVALID_STATUS,
        :NULL_POINTER,
        :INVALID_STRING,
        :INVALID_PATH_DATA,
        :READ_ERROR,
        :WRITE_ERROR,
        :SURFACE_FINISHED,
        :SURFACE_TYPE_MISMATCH,
        :PATTERN_TYPE_MISMATCH,
        :INVALID_CONTENT,
        :INVALID_FORMAT,
        :INVALID_VISUAL,
        :FILE_NOT_FOUND,
        :INVALID_DASH,
        :INVALID_DSC_COMMENT,
        :INVALID_INDEX,
        :CLIP_NOT_REPRESENTABLE,
        :TEMP_FILE_ERROR,
        :INVALID_STRIDE,
        :FONT_TYPE_MISMATCH,
        :USER_FONT_IMMUTABLE,
        :USER_FONT_ERROR,
        :NEGATIVE_COUNT,
        :INVALID_CLUSTERS,
        :INVALID_SLANT,
        :INVALID_WEIGHT,
        :INVALID_SIZE,
        :USER_FONT_NOT_IMPLEMENTED,
        :DEVICE_TYPE_MISMATCH,
        :DEVICE_ERROR,

        :LAST_STATUS
    ]


    # Surfaces
    cairo_method :surface_destroy,
      [:surface],
      :status

    # SVG surfaces
    cairo_method :svg_surface_create,
      [:filename, :width_double, :height_double],
      :surface

    # PNG surfaces
    cairo_method :image_surface_create_from_png,
      [:filename],
      :surface

    cairo_method :surface_write_to_png,
      [:surface, :filename],
      :status

    # Image surfaces
    cairo_method :image_surface_create,
      [:image_format, :width, :height],
      :surface


    # Contexts
    cairo_method :create,
      [:surface],
      :context

    cairo_method :destroy,
      [:context],
      :void

    # Drawing
    
    cairo_method :stroke,
      [ :context],
      :void

    # Paths
    cairo_method :get_current_point,
      [ :context, :x_pointer, :y_pointer ],
      :void
    
    cairo_method :close_path,
      [ :context],
      :void

    cairo_method :move_to,
      [ :context, :x, :y ],
      :void

    cairo_method :rel_move_to,
      [ :context, :x, :y ],
      :void

    cairo_method :line_to,
      [ :context, :x, :y ],
      :void

    cairo_method :rel_line_to,
      [ :context, :x, :y ],
      :void

    # creates an arc centered at x,y drawn with :radius from angle_start to angle_end
    cairo_method :arc,
      [ :context, :x, :y, :radius, :angle_start, :angle_end ],
      :void

    # draws the curve counter clockwise from start to end
    cairo_method :arc_negative,
      [ :context, :x, :y, :radius, :angle_start, :angle_end ],
      :void

    cairo_method :curve_to,
      [ :context, :control_point_x, :control_point_y, :control_point_x, :control_point_y, :to_x, :to_y ],
      :void

    cairo_method :rel_curve_to,
    [ :context, :control_point_x, :control_point_y, :control_point_x, :control_point_y, :to_x, :to_y ],
      :void

    cairo_method :rectangle,
      [ :context, :x, :y, :width_double, :height_double ],
      :void

    cairo_method :set_source_rgba,
      [ :context, :red, :green, :blue, :alpha ],
      :void

    cairo_method :set_source_rgb,
      [ :context, :red, :green, :blue ],
      :void

    cairo_method :fill,
      [ :context ],
      :void

  end
end
