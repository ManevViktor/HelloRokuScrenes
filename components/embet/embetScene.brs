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

m.top.translation = [1920 - 500, 200]

?"rect2 =" rect2



buttoinUI2 = CreateObject("roSGNode", "ButtonExample")
m.top.appendChild(buttoinUI2)
buttoinUI2.translation = [-470, 250]

m.root.opacity =0.9

?"UI buttonUI2" buttoinUI2.boundingRect()
?"UI embet" m.root.boundingRect()

initlib()

end sub


sub initlib()
    
end sub

sub onLoadStatus(ev)
    status = ev.getData()
    if status = "ready" then

        ' bcLib was successfully downloaded and all its components are now accessible

    else if status = "loading" then

        ' bcLib package is currently being downloaded

    else if status = "failed" then

        ' Something went wrong with the bcLib download/load process.
        ' Please check if the package URL was properly set.

    end if
end sub