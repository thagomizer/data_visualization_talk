require 'rubygems'
require 'graph'

digraph do
  node_attribs << filled
  colorscheme(:purples, 4)
  c1 << node("A")
  c2 << node("B")
  c3 << node("C")
  c4 << node("D")
  edge "A", "B", "C", "D"
  save "color_scheme_c", "pdf"
end
