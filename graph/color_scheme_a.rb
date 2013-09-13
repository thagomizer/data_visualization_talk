require 'rubygems'
require 'graph'

digraph do
  node_attribs << filled
  colorscheme(:set2, 4)
  c1 << node("A")
  c2 << node("B")
  c3 << node("C")
  c4 << node("D")
  edge "A", "B", "C", "D"
  save "color_scheme_a", "pdf"
end
