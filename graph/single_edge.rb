require 'rubygems'
require 'graph'

digraph do
  edge "A", "B"
  save "single_edge", "pdf"
end
