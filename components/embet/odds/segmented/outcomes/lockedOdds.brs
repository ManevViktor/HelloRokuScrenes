sub init ()

      m.roundedRect = m.top.findNode("posterLock2")
      m.rect = m.top.findNode("roundedRectCell")
      m.image = m.top.findNode("posterLock")

end sub


sub onNewWidth(evn as object)
      width = m.top.width
      height = 50
     m.rect.width = width 
   

      ?"image "m.image.width " " m.image.height

      ' m.roundedRect.maskSize = [width ,height]
       m.roundedRect.width = width - 5
       m.roundedRect.height = height - 5
       m.roundedRect.translation = "[2,2]"
      
      newX = Cint((width/2) - (m.image.width/2)) 
      nexy = Cint((height/2) - (m.image.height/2))
      m.image.translation = [newX.getInt() +2, nexy]
end sub