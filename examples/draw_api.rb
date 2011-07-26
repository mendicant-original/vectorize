$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))
require 'vectorize'

# Starting from scratch and saving to foo.png
Vectorize.draw(
  basename: "foo", 
  formats: [:png], 
  width: 200, 
  height: 200
) do |v|
  v.move_to Vectorize.point(20,20)
  v.line_to Vectorize.point(180,180)
  v.stroke

  v.move_to Vectorize.point(180,20)
  v.line_to Vectorize.point(20,180)
  v.stroke
end

# Modifying an existing PNG image
Vectorize.draw(
  source: "foo.png",
  basename: "new_foo", 
  formats: [:png]) do |v|
  v.circle center: Vectorize.point(100,100), radius: 80
  v.stroke
end

# Saving as a PDF
Vectorize.draw(
  basename: "draw_pdf", 
  formats: [:pdf], 
  width: 200, 
  height: 200
) do |v|
  v.move_to Vectorize.point(20,20)
  v.line_to Vectorize.point(180,180)
  v.stroke
  
end

# draw a circle
Vectorize.draw(
  :basename => "draw_circle", 
  :formats  => [:png], 
  :width    => 400, 
  :height   => 400
) do |v|
  v.circle center: Vectorize.point(200, 200), radius: 150
  v.stroke
end

# draw a square 
Vectorize.draw(
  :basename => "draw_square", 
  :formats  => [:png], 
  :width    => 400, 
  :height   => 400
) do |v|
  v.square upper_left: Vectorize.point(50, 50), side_size: 300
  v.stroke
end

# draw a polygon
 Vectorize.draw(
  :basename => "draw_polygon", 
  :formats  => [:png], 
  :width    => 400, 
  :height   => 400
 ) do |v|
   v.polygon center: Vectorize.point(200, 200), radius: 150, sides: 7
   v.stroke
end

# draw some text
Vectorize.draw(
  :basename => "hello_world",
  :formats  => [:png],
  :width    => 400,
  :height   => 400
  ) do |v|
    v.write "Hello World", :upper_left => 0, 40
end

# draw text in any font
Vectorize.draw(
  :basename => "hello_font",
  :formats  => [:png],
  :width    => 400,
  :height   => 400
  ) do |v|
    v.write "Helvetica World", :upper_left => 0, 40, :font => "Helvetica"
end

# specify the size
Vectorize.draw(
  :basename => "hello_font_size",
  :formats  => [:png],
  :width    => 400,
  :height   => 400
  ) do |v|
    v.write "Hello World", :upper_left => 0, 40, :font => "Helvetica", :size => 40
end

