sub init ()

      m.root = m.top.findNode("posterLock2")
      m.rect = m.top.findNode("rootCell")
      m.image = m.top.findNode("posterLock")

end sub


sub onNewWidth(evn as object)
      width = m.top.width
      height = 50
     m.rect.width = width 
   

      ?"image "m.image.width " " m.image.height

      ' m.root.maskSize = [width ,height]
       m.root.width = width - 10
       m.root.height = height - 5
       m.root.translation = "[5,2]"
      
      newX = Cint((width/2) - (m.image.width/2)) 
      nexy = Cint((height/2) - (m.image.height/2))
      m.image.translation = [newX.getInt() +2, nexy]
end sub