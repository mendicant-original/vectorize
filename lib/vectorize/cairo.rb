require 'ffi'

module Vectorize
  module Cairo
    extend FFI::Library

    ffi_lib ENV["CAIRO_LIB"] || "cairo"

    def self.cairo_method(method_name, arguments, return_type)
      attach_function method_name,
        "cairo_#{method_name}",
        arguments,
        return_type
    end

    # type defs to make life easier when reading and writing these methods
    typedef :pointer,   :surface
    typedef :pointer,   :context
    typedef :pointer,   :matrix
    typedef :pointer,   :font_options
    typedef :pointer,   :font_face
    typedef :pointer,   :scaled_font
    typedef :pointer,   :glyphs
    typedef :pointer,   :clusters
    typedef :pointer,   :extents
    typedef :pointer,   :x_pointer
    typedef :pointer,   :y_pointer
    typedef :double,    :x
    typedef :double,    :y
    typedef :double,    :xx
    typedef :double,    :xy
    typedef :double,    :yx
    typedef :double,    :yy
    typedef :double,    :x0
    typedef :double,    :y0
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
    typedef :double,    :size
    typedef :string,    :font_family
    typedef :int,       :length
    typedef :int,       :num_glyphs
    typedef :int,       :num_clusters
    
    # enums
    enum :image_format, [
      :INVALID, -1,
      :ARGB32,
      :RGB234,
      :A8,
      :A1,
      :RGB16_565
    ]

    enum :font_slant, [
      :NORMAL,
      :ITALIC,
      :OBLIQUE
    ]

    enum :font_weight, [
      :NORMAL,
      :BOLD
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

    # PDF surfaces
    cairo_method :pdf_surface_create,
      [:filename, :width_double, :height_double],
      :surface

    cairo_method :show_page,
      [:context],
      :void

    # Image surfaces
    cairo_method :image_surface_create,
      [:image_format, :width, :height],
      :surface

    # Matrices

    cairo_method :matrix_init,
      [:matrix, :xx, :yx, :xy, :yy, :x0, :y0],
      :void


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

    # creates an arc centered at x,y drawn with
    # :radius from angle_start to angle_end
    cairo_method :arc,
      [ :context, :x, :y, :radius, :angle_start, :angle_end ],
      :void

    # draws the curve counter clockwise from start to end
    cairo_method :arc_negative,
      [ :context, :x, :y, :radius, :angle_start, :angle_end ],
      :void

    cairo_method :curve_to,
      [
        :context,
        :control_point_x,
        :control_point_y,
        :control_point_x,
        :control_point_y,
        :to_x,
        :to_y
      ],
      :void

    cairo_method  :rel_curve_to,
      [
        :context,
        :control_point_x,
        :control_point_y,
        :control_point_x,
        :control_point_y,
        :to_x,
        :to_y
      ],
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

    # text methods
    cairo_method :select_font_face,
      [ :context, :font_family, :font_slant, :font_weight],
      :void

    cairo_method :set_font_size,
      [ :context, :size ],
      :void

    cairo_method :set_font_matrix,
      [ :context, :matrix ],
      :void

    cairo_method :get_font_matrix,
      [ :context, :matrix ],
      :void

    cairo_method :set_font_options,
      [ :context, :font_options],
      :void

    cairo_method :get_font_options,
      [ :context, :font_options],
      :void

    cairo_method :get_font_face,
      [ :context ],
      :font_face

    cairo_method :set_scaled_font,
      [:context, :scaled_font],
      :void

    cairo_method :get_scaled_font,
      [:context ],
      :scaled_font

    cairo_method :show_text,
      [:context, :string ],
      :void      

    cairo_method :show_glyphs,
      [:context, :glyphs, :num_glyphs],
      :void

    cairo_method :font_extents,
      [ :context, :extents ],
      :void

    cairo_method :text_extents,
      [ :context, :string, :extents ],
      :void

    cairo_method :glyph_extents,
      [ :context, :glyphs, :num_glyphs, :extents ],
      :void

    cairo_method :toy_font_face_create,
      [ :font_family, :font_slant, :font_weight ],
      :font_face

    cairo_method :toy_font_face_get_family,
      [ :font_face ], 
      :string

    cairo_method :toy_font_face_get_slant,
      [ :font_face ],
      :font_slant

    cairo_method :toy_font_face_get_weight,
      [ :font_face ],
      :font_weight

    cairo_method :glyph_allocate,
      [:num_glyphs],
      :glyphs

    cairo_method :glyph_free,
      [:glyphs],
      :void

    cairo_method :text_cluster_allocate,
      [:num_clusters],
      :clusters

    cairo_method :text_cluster_free,
      [:clusters],
      :void

  end
end
