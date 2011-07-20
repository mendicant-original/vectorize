module Vectorize
  
  class Path

    def initialize(context)
      @context = context
    end
    
    def stroke
      Cairo.stroke(@context)
    end

    def move_to(point)
      Cairo.move_to(
        @context, 
        point.x, 
        point.y 
      )
    end

    def move_relative(point)
      Cairo.rel_move_to(
        @context, 
        point.x, 
        point.y 
      )
    end

    def line_to(point)
      Cairo.line_to(
        @context, 
        point.x, 
        point.y 
      )
    end

    def line_relative(point)
      Cairo.rel_line_to(
        @context, 
        point.x, 
        point.y 
      )
    end

    def close_path
      Cairo.close_path(@context)
    end

    def arc(params)
      Cairo.arc(
        @context, 
        params[:center].x, 
        params[:center].y, 
        params[:radius], 
        params[:angle_start], 
        params[:angle_end]
      )
    end

    def arc_counterclockwise(params)
      Cairo.arc_negative(
        @context, 
        params[:center].x, 
        params[:center].y, 
        params[:radius], 
        params[:angle_start], 
        params[:angle_end]
      )
    end

    def curve(params)
      Cairo.curve_to(
        @context, 
        params[:point1].x, 
        params[:point1].y, 
        params[:point2].x, 
        params[:point2].y, 
        params[:center].x, 
        params[:center].y 
      )
    end

    def curve_relative(params)
      Cairo.rel_curve_to(
        @context, 
        params[:point1].x, 
        params[:point1].y, 
        params[:point2].x, 
        params[:point2].y, 
        params[:center].x, 
        params[:center].y
      )
    end

    def position
      x = FFI::MemoryPointer.new :double, 1, true
      y = FFI::MemoryPointer.new :double, 1, true
      Cairo.get_current_point(@context, x, y)
      Point.new(x.get_double(0), y.get_double(0))
    end

    # shapes
    
    def rectangle(params)
      Cairo.rectangle(
        @context, 
        params[:upper_left].x, 
        params[:upper_left].y, 
        params[:width_double], 
        params[:height_double]
      )
    end
    
    def square(params)
      Cairo.rectangle(
        @context, 
        params[:upper_left].x, 
        params[:upper_left].y, 
        params[:side_size], 
        params[:side_size]
      )
    end

    def circle(params)
      Cairo.arc(
        @context, 
        params[:center].x, 
        params[:center].y, 
        params[:radius], 
        0, 
        360
      )
    end
    
    # create equilateral polygons
    def polygon(params)
      x     = params[:center].x
      y     = params[:center].y
      size  = params[:radius]
      sides = params[:sides]
        
      angle = (Math::PI * 2.0) / sides

      move_to Point.new(x + size, y)
      (1..sides).each do |index|
        line_to Point.new(
          x + (size * Math.cos(angle * index)),
          y + (size * Math.sin(angle * index))
        )
      end
      
    end

    # Fills

    def source_color(params)
      if params[:a]
        Cairo.set_source_rgba(
          @context, 
          params[:r], 
          params[:g], 
          params[:b], 
          params[:a]
        )
      else
        Cairo.set_source_rgb(
          @context, 
          params[:r], 
          params[:g], 
          params[:b]
        )
      end
    end

    def fill
      Cairo.fill(@context)
    end
    
  end
  
end
