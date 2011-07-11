$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))
$: << '.'

require 'rspec'
require 'vectorize'

def path(file)
  File.expand_path(File.join(File.dirname(file)))
end
