require 'spec_helper'

describe Vectorize::Text do

  context "When writing words" do
    
    it "writes 'Mark is late'" do
      
      Vectorize.draw(
        basename: "tmp/text", 
        formats: [:png], 
        width:  100, 
        height: 100
      ) do |v|
        v.write("Hello", :upper_left => Point(0, 40), :size => 30)
        v.write("World!", :upper_left => Point(0, 80), :size => 35)
      end
    end

    it "doesn't override the previous font/size calls" do

      Vectorize.draw(
        basename: "tmp/no_override",
        formats: [:png],
        width: 200,
        height: 100,
      ) do |v|
        v.set_font("Arial")
        v.set_font_size(60)
        v.write("Hello!", :upper_left => Point(0, 80))
      end
    end

    it "overrides the previous font/size calls when explicitly specified" do
      Vectorize.draw(
        basename: "tmp/override",
        formats: [:png],
        width: 100,
        height: 100,
      ) do |v|
        v.set_font("Arial", :weight => :NORMAL)
        v.set_font_size(60)
        v.write("World", :upper_left => Point(0, 80), :font => "Helvetica", :weight => :BOLD, :size => 30)
      end
    end
  end
  
end