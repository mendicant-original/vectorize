require 'spec_helper'

describe Vectorize::DSL do

  context "When creating a DSL block" do
    
    it "should accept a block of commands" do
      expect do
        Vectorize.draw(100, 100) do
          # do stuff
        end
      end.should_not raise_error
    end
    
  end

  context "When creating paths" do
   
    
  end


end