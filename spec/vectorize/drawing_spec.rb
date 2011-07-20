require 'spec_helper'

describe Vectorize::Drawing do

  context "When creating a draw block" do
    
    it "should accept a block of commands" do
      expect do
        Vectorize.draw(
          basename: "tmp/tmp", 
          formats: [:png], 
          width: 100, 
          height: 100
        ) do |v|
          # do stuff
        end
      end.should_not raise_error
    end
    
  end

end
