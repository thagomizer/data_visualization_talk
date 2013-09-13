require 'rubygems'
require 'graph'

digraph do
  node_attribs << triangle
  edge "A", "B"
  edge "B", "C"
  edge "C", "A"

  save "triangles", "pdf"
end
