# Vectorize
A wrapper and API for the C 
[Cairo graphics library](http://cairographics.org/) using 
[Ruby FFI](https://github.com/ffi/ffi).  

## Installation
`$ [sudo] gem install vectorize`  

### Where in the World is Cairo?

You now need to set an environment variable, `CAIRO_LIB`, so Vectorize will know where to find the Cairo library.

On a system with a Bash shell, like Linux and OS X, you might set the variable like so:

    $ export CAIRO_LIB="/usr/local/Cellar/cairo/1.10.2/lib/libcairo.dylib"

Depending on where your library is located of course.

If you're using [Homebrew](http://mxcl.github.com/homebrew/) for OS X and you installed Cairo using `brew install cairo` then you can simply run the following command line. No need to worry about the environment variable:

    $ brew link cairo

## Usage Directions
After you require vectorize, `require "vectorize"`, in your Ruby app you can either use the one-to-one mappings of the Cairo wrapper or you can use the Vectorize::Drawing class.  

The Vectorize::Drawing class when combined with the Vectorize#draw method acts  as an API to the Cairo wrapper. It adds several helper methods and makes using Cairo from Ruby much easier. The Vectorize::Drawing class even handles memory management for you so you don't have to worry about memory leaks.  

### Using the drawing API
The Vectorize::Drawing class cleans up the Cairo library names and adds some helpful abstractions like drawing polygons but to get the full power of the API you'll want to use the Vectorize#draw method to handle memory management.  

The drawing API also simplifies file creation and saving; when the draw block ends the specified image file is automatically saved/updated.

#### Vectorize API examples
Here are a few examples of just how easy it is to draw some simple shapes.

    require "vectorize"

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

Here are the exact same shapes drawn using the Cairo wrapper. As you can see this requires quite a bit more work on your part:

Note: These need to be updated to reflect the corrections that will make them work.

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

For more examples see the `./examples` directory.

# License

Copyright (c) 2011 Andy Lindeman, Mike Bethany, Ruby Mendicant University  

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  

# Additional Licenses

Refer to Cairo for its license terms.
