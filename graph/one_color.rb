require 'rubygems'
require 'graph'

digraph do
  node_attribs << red
  edge_attribs << blue
  edge "A", "B", "C"

  save "one_color", "pdf"
end
