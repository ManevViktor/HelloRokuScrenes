sub init()
      m.rect = m.top.findNode("rectRoot")
      m.group = m.top.findNode("groupOutcomes")
      m.labelPrimary = m.top.findNode("lblPrimary")
      m.labelSecondary = m.top.findNode("lbldescripton")
      m.roundedRect = m.top.findNode("roundedRect")
end sub



sub cellConfig(evn as object)

      ?"config ="  evn.getData().marketDetails
      config = evn.getData()

      width = config.size[0]
      height = config.size[1]

      m.rect.width = config.size[0]
      m.labelPrimary.width = config.size[0]
      m.labelSecondary.width = config.size[0]
      m.rect.height = config.size[1]
      ' m.rect.color = config.style.bgcolor

      ?"config size" config.size[1]
      y = (config.size[1]/2) - 13
      m.group.translation = [0 , y]

      m.labelPrimary.text = config.marketDetails.odds
      m.labelPrimary.font.size = config.style.primaryFontSize
      
      m.labelSecondary.text = config.marketDetails.description
      m.labelSecondary.font.size = config.style.secondaryFontSize


      m.roundedRect.width = width - 10
      m.roundedRect.height = height
      m.roundedRect.translation = [5,0]


      
      anim =CreateObject("roSGNode", "animationInidicatorUp")
      ' m.top.appendChild(anim)
      ' anim.translation = [2]


end sub