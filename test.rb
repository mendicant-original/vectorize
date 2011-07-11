module Qix
  def add_alias
    # baz and bar are dynamic values
    alias_name = "baz"
    method_name = "bar"
    class_eval "class << self; alias_method :#{alias_name}, :#{method_name}; end"
  end
end

class Foo
  extend Qix
  def self.bar
  end
  add_alias
end

puts Foo.public_methods.include? :baz
