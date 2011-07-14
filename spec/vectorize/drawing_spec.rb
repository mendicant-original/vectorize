require 'spec_helper'

describe Vectorize::Drawing do

  context "When creating a draw block" do
    
    it "should accept a block of commands" do
      expect do
        Vectorize.draw(width: 100, height: 100) do |v|
          # do stuff
        end
      end.should_not raise_error
    end
    
  end

  context "When drawing paths" do

    context "and you're drawing shapes" do
      
      it "should draw a polygon" do
        Vectorize.draw(width: 400, height: 400) do |v|
          v.polygon x: 200, y: 200, size: 150, sides: 7
          v.stroke
          v.save_as_png "tmp/polygon.png"
        end
      end
      
      it "should draw a circle" do
        Vectorize.draw(width: 400, height: 400) do |v|
          v.circle x: 200, y: 200, radius: 150
          v.stroke
          v.save_as_png "tmp/circle.png"
        end
      end
      
      it "should draw a square" do
        Vectorize.draw(width: 400, height: 400) do |v|
          v.square x: 200, y: 200, size: 150
          v.stroke
          v.save_as_png "tmp/square.png"
        end
      end
      
    end
    
  end

end
