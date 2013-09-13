require 'rubygems'
require 'graph'

digraph do
  edge "A", "B"
  edge "B", "C"
  edge "C", "A"
  save "saving", "pdf"
end
