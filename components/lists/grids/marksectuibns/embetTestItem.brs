sub init()
      m.label = m.top.findNode("labelMarkup")
      m.rect = m.top.findNode("rectMarkup")
end sub


sub itemContentChanged()

      content = m.top.itemContent


      m.rect.width = content.width
      m.label.text = content.num

end sub