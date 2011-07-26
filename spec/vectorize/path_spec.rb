require 'spec_helper'

describe Vectorize::Path do

  context "When drawing shapes" do

    it "should draw a polygon" do

      Vectorize.draw(
        basename: "tmp/polygon",
        formats: [:png],
        width:  400,
        height: 400
      ) do |v|
        v.polygon center: Vectorize.point(200, 200), radius: 150, sides: 7
        v.stroke
      end
    end

    it "should draw a circle" do
      Vectorize.draw(
        basename: "tmp/circle",
        formats: [:png],
        width:  400,
        height: 400
      ) do |v|
        v.circle center: Vectorize.point(200, 200), radius: 150
        v.stroke
      end
    end

    it "should draw a square" do
      Vectorize.draw(
        basename: "tmp/square",
        formats: [:png],
        width:  400,
        height: 400
      ) do |v|
        v.square upper_left: Vectorize.point(200, 200), side_size: 150
        v.stroke
      end
    end

    it "should return its position" do
      Vectorize.draw(
        basename: "tmp/blank",
        formats: [:png],
        width:  400,
        height: 400
      ) do |v|
        v.move_to Vectorize.point(200, 200)
        v.position.should == Vectorize.point(200, 200)
      end

    end

  end

end
