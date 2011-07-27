$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))
require 'vectorize'

# Starting from scratch and saving to foo.png
drawing_options = {
  :basename => "foo",
  :formats  => [:png],
  :width    => 200,
  :height   => 200
}

Vectorize.draw(drawing_options) do |v|
  v.move_to Vectorize.point(20,20)
  v.line_to Vectorize.point(180,180)
  v.stroke

  v.move_to Vectorize.point(180,20)
  v.line_to Vectorize.point(20,180)
  v.stroke
end

# Modifying an existing PNG image
drawing_options = {
  :source   => "foo.png",
  :basename => "new_foo",
  :formats  => [:png]
}

Vectorize.draw(drawing_options) do |v|
  v.circle center: Vectorize.point(100,100), radius: 80
  v.stroke
end

# Saving as a PDF
drawing_options = {
  :basename => "draw_pdf",
  :formats  => [:pdf],
  :width    => 200,
  :height   => 200
}

Vectorize.draw(drawing_options) do |v|
  v.move_to Vectorize.point(20,20)
  v.line_to Vectorize.point(180,180)
  v.stroke

end

# Draw a circle and save as a PNG
drawing_options = {
  :basename => "draw_circle",
  :formats  => [:png],
  :width    => 400,
  :height   => 400
}

Vectorize.draw(drawing_options) do |v|
  v.circle center: Vectorize.point(200, 200), radius: 150
  v.stroke
end

# Draw a square and save as an SVG
drawing_options = {
  :basename => "draw_square",
  :formats  => [:svg],
  :width    => 400,
  :height   => 400
}

Vectorize.draw(drawing_options) do |v|
  v.square upper_left: Vectorize.point(50, 50), side_size: 300
  v.stroke
end

# Draw a polygon and save as a PDF
drawing_options = {
  :basename => "draw_polygon",
  :formats  => [:pdf],
  :width    => 400,
  :height   => 400
}

Vectorize.draw(drawing_options) do |v|
  v.polygon center: Vectorize.point(200, 200), radius: 150, sides: 7
  v.stroke
end

# draw some text
drawing_options = {
  :basename => "hello_world",
  :formats  => [:png],
  :width    => 400,
  :height   => 400
}

Vectorize.draw(drawing_options) do |v|
  v.write "Hello World", :upper_left => 0, 40
end

# draw text in any font
drawing_options = {
  :basename => "hello_font",
  :formats  => [:png],
  :width    => 400,
  :height   => 400
}

Vectorize.draw(drawing_options) do |v|
  v.write "Helvetica World", :upper_left => 0, 40, :font => "Helvetica"
end

# specify the size
drawing_options = {
  :basename => "hello_font_size",
  :formats  => [:png],
  :width    => 400,
  :height   => 400
}

Vectorize.draw(drawing_options) do |v|
  v.write "Hello World", :upper_left => 0, 40, :font => "Helvetica", :size => 40
end

