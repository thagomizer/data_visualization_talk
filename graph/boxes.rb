require 'rubygems'
require 'graph'

digraph do
  boxes
  edge "A", "B"
  edge "A", "C"
  save "boxes", "pdf"
end
