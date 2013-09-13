require 'rubygems'
require 'graph'

digraph do
  node_attribs << filled
  edge "G", "O", "R", "P"
  green  << node("G")
  orange << node("O")
  red    << node("R")
  purple << node("P")

  save "many_colors", "pdf"
end
