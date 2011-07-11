require 'spec_helper'

describe Cairo::FFI do

  it "should create aliases for methods with the object path names removed" do
    module Foo
      module Bar
        extend Cairo::FFI
        extend FFI::Library
        ffi_lib "#{path(__FILE__)}/foo.dylib" 
        attach_function :foo_bar_do_something, [], :void
        clean_method_names
      end
    end
    Foo::Bar.public_methods(false).should include :do_something
  end

end
