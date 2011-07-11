module Qix
  def add_alias
    # baz and bar are dynamic values
    alias_name = "baz"
    method_name = :bar
    singleton_class.send :alias_method, alias_name.to_sym, method_name
  end
end

class Foo
  extend Qix
  def self.bar
  end
  add_alias
end

puts Foo.public_methods.include? :baz

