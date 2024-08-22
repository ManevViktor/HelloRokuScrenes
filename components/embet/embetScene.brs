sub init()

? m.top.boundingRect()

rect=  m.top.boundingRect()

?"widgetRoot" m.top.localBoundingRect()

m.headerText = m.top.findNode("embetOddsHeaderText")
m.root = m.top.findNode("embetOddsRoot")
rect2 = m.headerText.boundingRect()

' node.translation = [rect2.width/2 , rect2.height/2 + 10]
m.headerText.width = rect.width/2 - 50
x = rect.width/2 

m.headerText.translation = [x,0]

?"rect2 =" rect2


end sub