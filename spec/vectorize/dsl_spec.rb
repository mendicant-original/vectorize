require 'spec_helper'

describe Vectorize::DSL do

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
      
      it "should draw a rectangle" do
        Vectorize.draw(100, 100) do |v|
          #v.square()
        end
      end
      
    end
    
  end

end