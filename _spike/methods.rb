
class Foo
 
   def add_object_methods(object)
      object.public_methods(false).each do |method_name|
        
        self.class.class_eval do
          if object.method(method_name).arity > 0 
            define_method method_name do |argument_hash|
              object.send method_name, argument_hash
            end
          else
            define_method method_name do 
              object.send method_name
            end
          end
        end
      end
    end

end

class Bar
  def baz(args)
    "baz called: #{args}"
  end
  def qix
    "qix called"
  end
end

f = Foo.new
b = Bar.new

f.add_object_methods(b)
puts f.baz("blimy")
puts f.qix()
