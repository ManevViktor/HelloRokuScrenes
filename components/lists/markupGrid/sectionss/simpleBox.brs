sub init()
m.label = m.top.findNode("labelMarkup")
m.rect = m.top.findNode("rectMarkUp")
end sub


sub itemContentChanged()

      content = m.top.itemContent
      m.rect.width = content.width
      m.label.width = content.width
      m.label.text = content.num


      

      ?"item "content.width 

endsub