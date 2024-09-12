sub init()
      m.rect = m.top.findNode("rectMarkUp")
      m.label = m.top.findNode("labelMarkup")
end sub


sub itemContentChanged()

      con = m.top.itemContent

      m.label.text = m.top.itemContent.teamHomeOdds
      m.rect.width = con.width
      m.label.width = con.width
end sub
