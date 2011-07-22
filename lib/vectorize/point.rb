module Vectorize
  
  class Point
    attr_accessor :x, :y
    def initialize(x,y)
      @x, @y = x, y
    end
    
    def ==(other_point)
      [@x, @y] == [other_point.x, other_point.y]
    end
    
    def <=>(other_point)
      [@x, @y] <=> [other_point.x, other_point.y]
    end
    
  end

  def self.point(x,y)
    Vectorize::Point.new(x,y)
  end

end