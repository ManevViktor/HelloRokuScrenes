sub init()

? m.top.boundingRect()

rect=  m.top.boundingRect()

?m.top.localBoundingRect()

node = m.top.findNode("information")

rect2 = node.boundingRect()

?rect2

' node.translation = [rect2.width/2 , rect2.height/2 + 10]
node.width = rect2.width
node.height = rect2.height


end sub