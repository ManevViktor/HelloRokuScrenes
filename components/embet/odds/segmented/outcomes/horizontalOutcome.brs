sub init()
      m.rect = m.top.findNode("rectRoot")
      m.group = m.top.findNode("groupOutcomes")
      m.labelPrimary = m.top.findNode("lblPrimary")
      m.labelSecondary = m.top.findNode("lbldescripton")
      m.roundedRect = m.top.findNode("roundedRect")
end sub



sub cellConfig(evn as object)

      config = evn.getData()

      width = config.size[0]
      height = config.size[1]

      m.rect.width = config.size[0]
      m.labelPrimary.width = config.size[0]
      m.labelSecondary.width = config.size[0]
      m.rect.height = config.size[1]
      ' m.rect.color = config.style.bgcolor


      y = (config.size[1] / 2) - 13
      m.group.translation = [0, y]

      if(config.marketDetails <> invalid) then

            m.labelPrimary.text = config.marketDetails.odds
            m.labelPrimary.font.size = config.style.primaryFontSize

            m.labelSecondary.text = config.marketDetails.description
            m.labelSecondary.font.size = config.style.secondaryFontSize

            if(config.marketDetails.isSuspended = true)
                  obj = CreateObject("roSgNode", "lockedOdds")      
                  m.top.appendChild(obj)      
                  data = {
                        size: [width, height]
                  }      
                  obj.configdata = data    
            else 
                  animateProp(config, width, height)
             end if
      end if

      m.roundedRect.width = width - 10
      m.roundedRect.height = height
      m.roundedRect.translation = [5, 0]


      ' m.top.appendChild(anim)
      ' anim.translation = [2]


end sub

sub animateProp(config as object, width , height) 
      
      if(config.streamAnim = "up")
            anim = CreateObject("roSGNode", "animationInidicatorUp")
            m.top.appendChild(anim)
            anim.translation = [width - 25, (height/2) -5]
      else if config.streamAnim = "down"
            anim = CreateObject("roSGNode", "animationInidicatorDown")
            m.top.appendChild(anim)
            anim.translation = [width - 25, (height/2) -5]
      end if

endsub