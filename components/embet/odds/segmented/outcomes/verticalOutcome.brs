
sub init()

      m.rect = m.top.findNode("rectRoot")
      m.labelPrimary = m.top.findNode("labelPrimary")
     ' m.roundedRect
end sub


sub cellConfig(evn as object)

      ?"config ="  evn.getData().size
      config = evn.getData()


      m.rect.width = config.size[0]
      m.rect.height = config.size[1]
      ' m.rect.color = config.style.bgcolor

      m.labelPrimary.text = config.displayText
      m.labelPrimary.width = config.size[0]
      m.labelPrimary.height = config.size[1]
      m.labelPrimary.font.size = config.style.primaryFontSize

end sub