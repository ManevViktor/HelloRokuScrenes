
sub init()

      m.rect = m.top.findNode("rectRoot")
      m.labelPrimary = m.top.findNode("labelPrimary")
      m.roundedRect = m.top.findNode("roundedRect")
end sub


sub cellConfig(evn as object)


      config = evn.getData()

      width = config.size[0]
      height = config.size[1]


      m.rect.width = width
      m.rect.height = config.size[1]
      m.roundedRect.width = width - 10
      m.roundedRect.height = height
      m.roundedRect.translation = [5,0]
      ' m.rect.color = config.style.bgcolor

      m.labelPrimary.text = config.displayText

      m.labelPrimary.width = width
      m.labelPrimary.height = config.size[1]

      m.labelPrimary.font.size = config.style.primaryFontSize

end sub