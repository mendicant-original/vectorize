require 'spec_helper'

describe Vectorize::Drawing do

  context "When creating a DSL block" do
    
    it "should accept a block of commands" do
      expect do
        Vectorize.draw(100, 100) do |v|
          # do stuff
        end
      end.should_not raise_error
    end
    
  end

  context "When drawing paths" do

    context "and you're drawing shapes" do
      
      # it "should draw a pentagon" do
      #   Vectorize.draw(400, 400) do |v|
      #     v.polygon(x: 200, y:200, size: 100, sides: 5)
      #     v.stroke
      #     v.save_as_png "foo.png"
      #   end
      # end
      
    end
    
  end

end