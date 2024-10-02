sub init()

      m.rect = m.top.findNode("rectVertical")
      m.vertImg = m.top.findNode("posterodds")
      m.labelPrimary = m.top.findNode("vLabelTeam")
      m.group = m.top.findNode("groupHorizontal")
end sub

sub onNewWidth(evn as object)
      width = evn.getData().width

      m.labelPrimary.width = width
      m.rect.width = width
end sub


sub cellConfig(evn as object)

      config = evn.getData()


      m.rect.width = config.size[0]
      m.rect.height = config.size[1]
      ' m.rect.color = config.style.bgcolor

      m.labelPrimary.text = config.displayText
      m.labelPrimary.width = config.size[0] - 30
      m.labelPrimary.height = config.size[1]
      m.labelPrimary.font.size = 15

      y = (config.size[1]/2) - (m.vertImg.height/2)

      if(m.group <> invalid) then
      m.group.translation=[10,0]
      endif
     m.vertImg.translation = [15, y]

end sub