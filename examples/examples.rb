$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))
require 'vectorize'

# Starting from scratch and saving to foo.png
Vectorize.draw(
  basename: "foo", 
  formats: [:png], 
  width: 200, 
  height: 200
) do |v|
  v.move_to point: {x: 20, y: 20}
  v.line_to point: {x: 150, y: 150}
  v.stroke
end

# Modifying an existing PNG image
Vectorize.draw(
  source: "/tmp/foo.png",
  basename: "new_foo", 
  formats: [:png]) do |v|
  v.circle point: {x: 200, y: 200}, radius: 150
  v.stroke
end

# Saving as a PDF
Vectorize.draw(
  basename: "foo", 
  formats: [:pdf], 
  width: 200, 
  height: 200
) do |v|
  # draw things
end