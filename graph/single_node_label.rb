require 'rubygems'
require 'graph'

digraph do
  node("B").label "Hello"

  save "single_node_label", "pdf"
end
