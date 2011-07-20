# Vectorize
A wrapper and facade for the C [Cairo graphics library](http://cairographics.org/) using [Ruby FFI](https://github.com/ffi/ffi).

## Installation
`$ [sudo] gem install vectorize`

## Usage Directions

After you require the library can either include the one-to-one mappings of  
the Cairo wrapper or you can use the Vectorize::Drawing class which acts like  
a facade to the Cairo wrapper, which adds several helper methods and makes  
using Cairo from Ruby much easier. The Vectorize::Drawing class even handles  
memory management for you so you don't have to worry about memory leaks.

### Using the Cairo wrapper directly
If you would just like to use the Cairo methods you're used to you can use the  
Vectorize::Cairo module but it is vastly more complicated. (see examples)

The only difference you'll need to be aware of when calling Cairo methods is  
the Cairo method names have been simplified by removing the redundant cario\_  
prefix to all the method calls.

For instance `cairo_image_surface_create` becomes `image_surface_create`.  

#### Vectorize::Cairo API Example

		require 'vectorize'

		class MyCoolDrawingThing
	
		  def draw_line(
				start_point_x, 
				start_point_y, 
				end_point_x, 
				end_point_y, 
				image_width,
				image_height,
				file_name
			)
			  # create the drawing contexts
		    surface = Cairo.image_surface_create(:ARGB32, image_width, image_height)
				layer   = Cairo.create(surface)
		
				# draw the line
				Vectorize::Cairo.move_to(layer, start_point_x, start_point_y)
				Vectorize::Cairo.line_to(layer, end_point_x, end_point_y)

				# save the file
		    Vectorize::Cairo.surface_write_to_png(surface, filename)
		
				# clean up memory
		    Vectorize::Cairo.destroy(layer)
		    Vectorize::Cairo.surface_destroy(surface)
		  end
		
		end

Now compare this with using the drawing facade of Vectorize 
below (see the first example).

### Using the drawing facade
The Vectorize::Drawing class cleans up the Cairo library names and adds some  
helpful abstractions like drawing polygons but to get the full power of the  
facade you'll want to use the Vectorize#draw method to handle memory  
management.  

The drawing facade also simplifies file creation and saving; when the draw   
block ends the specified image file is automatically saved/updated.  

#### Vectorize facade examples

This demonstrates a complete example as above

		require 'vectorize'

		class MyCoolDrawingThing

		  def draw_line(
				start_point_x, 
				start_point_y, 
				end_point_x, 
				end_point_y, 
				image_width,
				image_height,
				file_name
			)
				Vectorize.draw(
				  basename: "line", 
				  formats: [:png], 
				  width:  image_width, 
				  height: image_height
				) do |v|
				  v.move_to {x: start_point_x, y: start_point_y}
				  v.line_to {x:end_point_x, end_point_y}
				end
			end
		end

Notice you don't have to worry about memory managment, surface and layer  
creation, or even saving the file; it's all done for you.

Here are a few more examples. We've removed the wrapper classes so we can
focus on the methods themselves.

		# draw a circle
		Vectorize.draw(
		  basename: "circle", 
		  formats: [:png], 
		  width:  400, 
		  height: 400
		) do |v|
		  v.circle center: {x: 200, y: 200}, radius: 150
		  v.stroke
		end

		# draw a square 
		Vectorize.draw(
		  basename: "square", 
		  formats: [:png], 
		  width:  400, 
		  height: 400
		) do |v|
		  v.square upper_left: {x: 200, y: 200}, side_size: 150
		  v.stroke
		end

		# draw a polygon
	  Vectorize.draw(
	    basename: "polygon", 
	    formats: [:png], 
	    width:  400, 
	    height: 400
	  ) do |v|
	    v.polygon center: {x: 200, y: 200}, radius: 150, sides: 7
	    v.stroke
	  end

# License

Copyright (c) 2011 Andy Lindeman, Mike Bethany, Ruby Mendicant University

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

# Additional Licenses

Refer to Cairo for its license terms.
