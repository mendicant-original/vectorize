$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))
require 'vectorize'

# Draw a circle and save as a PNG
# create the drawing contexts
surface = Vectorize::Cairo.image_surface_create(:ARGB32, 400, 400)
layer   = Vectorize::Cairo.create(surface)

# draw the shape
Vectorize::Cairo.arc(layer, 200, 200, 150, 0, 360)
Vectorize::Cairo.stroke(layer)

# save the file
Vectorize::Cairo.surface_write_to_png(surface, "cairo_circle.png")

# clean up memory
Vectorize::Cairo.destroy(layer)
Vectorize::Cairo.surface_destroy(surface)


# Draw a square and save as an SVG (need to update to save as an SVG)
# create the drawing contexts
surface = Vectorize::Cairo.image_surface_create(:ARGB32, 400, 400)
layer   = Vectorize::Cairo.create(surface)

# draw the shape
Vectorize::Cairo.rectangle(layer, 50, 50, 300, 300)
Vectorize::Cairo.stroke(layer)

# save the file
Vectorize::Cairo.surface_write_to_png(surface, "cairo_square.png")

# clean up memory
Vectorize::Cairo.destroy(layer)
Vectorize::Cairo.surface_destroy(surface)


# Draw a polygon and save as a PDF (need to fix PDF'ing and save as one)
# create the drawing contexts
surface = Vectorize::Cairo.image_surface_create(:ARGB32, 400, 400)
layer   = Vectorize::Cairo.create(surface)

# draw the shape
x     = 200
y     = 200
size  = 150
sides = 7

angle = (Math::PI * 2.0) / sides
Vectorize::Cairo.move_to(layer, x + size, y)
(1..sides).each do |index|
  Vectorize::Cairo.line_to(
    layer,
    x + (size * Math.cos(angle * index)),
    y + (size * Math.sin(angle * index))
  )
end
Vectorize::Cairo.stroke(layer)

# save the file
Vectorize::Cairo.surface_write_to_png(surface, "cairo_polygon.png")

# clean up memory
Vectorize::Cairo.destroy(layer)
Vectorize::Cairo.surface_destroy(surface)

