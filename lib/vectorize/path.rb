module Vectorize
  
  class Path

    def initialize(context)
      @context = context
    end

    def move_to(args)
      Cairo.move_to(@context, args[:x], args[:y])
    end

    def move_relative(args)
      Cairo.rel_move_to(@context, args[:x], args[:y])
    end

    def line_to(args)
      Cairo.line_to(@context, args[:x], args[:y])
    end

    def line_relative(args)
      Cairo.rel_line_to(@context, args[:x], args[:y])
    end

    def close_path
      Cairo.close_path(@context)
    end

    def arc(args)
      Cairo.arc(@context, args[:x], args[:y], args[:radius], args[:angle_start], args[:angle_end])
    end

    def arc_counterclockwise(args)
      Cairo.arc_negative(@context, args[:x], args[:y], args[:radius], args[:angle_start], args[:angle_end])
    end

    def curve(args)
      Cairo.curve_to(@context, args[:point1_x], args[:point1_y], args[:point2_x], args[:point2_y], args[:x], args[:y])
    end

    def curve_relative(args)
      Cairo.rel_curve_to(@context, args[:point1_x], args[:point1_y], args[:point2_x], args[:point2_y], args[:x], args[:y])
    end

    def position
      x = FFI::MemoryPointer.new :double, 1, true
      y = FFI::MemoryPointer.new :double, 1, true
      Cairo.get_current_point(@context, x, y)
      [x.get_double(0), y.get_double(0)]
    end

    # shapes
    
    def rectangle(args)
      Cairo.rectangle(@context, args[:x], args[:y], args[:width_double], args[:height_double])
    end
    
    def square(args)
      Cairo.rectangle(@context, args[:x], args[:y], args[:size], args[:size])
    end

    def circle(args)
      Cairo.arc(@context, args[:x], args[:y], args[:radius], 0, 360)
    end
    
    def polygon(args)
      
      Cairo.move_to(args[:x], args[:y] + args[:size])
      angle = 0
      # args[:sides].times do
      #   
      # end
    end
    
  end
  
end