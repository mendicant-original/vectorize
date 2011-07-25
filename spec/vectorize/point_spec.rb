require 'spec_helper'

describe Vectorize::Point do

  it "should set x when initialized" do
    point = Vectorize.point(10,20)
    point.x.should == 10
  end

  it "should set y when initialized" do
    point = Vectorize.point(10,20)
    point.y.should == 20
  end

  it "should equate points with equal values" do
    point1 = Vectorize.point(20,10)
    point2 = Vectorize.point(20,10)

    point1.should == point2
  end

  it "should sort using x then y" do
    point1 = Vectorize.point(10,10)

    point2 = Vectorize.point(5,10)
    point3 = Vectorize.point(10,5)
    point4 = Vectorize.point(10,10)

    point5 = Vectorize.point(10,20)
    point6 = Vectorize.point(20,10)
    point7 = Vectorize.point(20,20)

    [point7, point6, point5, point4, point3, point2, point1].sort.
      should == [point2, point3, point1, point4, point5, point6, point7]
  end

  it "should add a convenience constructor to the Vectorize module" do
    Vectorize.point(10,10).should be_a(Vectorize::Point)
  end

end

