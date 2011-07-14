require 'spec_helper'

describe Vectorize::Drawing do

  context "When creating a draw block" do
    
    it "should accept a block of commands" do
      expect do
        Vectorize.draw(basename: "tmp/tmp", formats: [:png], width: 100, height: 100) do |v|
          # do stuff
        end
      end.should_not raise_error
    end
    
  end

  context "When drawing paths" do

    context "and you're drawing shapes" do
      
      it "should draw a polygon" do
        Vectorize.draw(basename: "tmp/polygon", formats: [:png], width: 400, height: 400) do |v|
          v.polygon x: 200, y: 200, size: 150, sides: 7
          v.stroke
        end
      end
      
      it "should draw a circle" do
        Vectorize.draw(basename: "tmp/circle", formats: [:png], width: 400, height: 400) do |v|
          v.circle x: 200, y: 200, radius: 150
          v.stroke
        end
      end
      
      it "should draw a square" do
        Vectorize.draw(basename: "tmp/square", formats: [:png], width: 400, height: 400) do |v|
          v.square x: 200, y: 200, size: 150
          v.stroke
        end
      end
      
    end
    
  end

end
