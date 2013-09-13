require 'rubygems'
require 'graph'

digraph do
  edge "A", "B", "C"
  triangle << node("A")
  circle   << node("B")
  diamond  << node("C")

  save "many_shapes", "pdf"
end
