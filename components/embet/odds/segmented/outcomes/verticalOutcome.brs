
sub init()

      m.rect = m.top.findNode("rectRoot")
      m.labelPrimary = m.top.findNode("labelPrimary")
      m.roundedRect = m.top.findNode("roundedRect")
end sub


sub cellConfig(evn as object)


      config = evn.getData()

       if(config.marketDetails <> invalid) then

            width = config.size[0]
            height = config.size[1]


            m.rect.width = width
            m.rect.height = config.size[1]
            m.roundedRect.width = width - 10
            m.roundedRect.height = height
            m.roundedRect.translation = [5, 0]
            ' m.rect.color = config.style.bgcolor

            
            m.labelPrimary.width = width
            m.labelPrimary.height = config.size[1]
            
            m.labelPrimary.text = config.marketDetails.odds
            m.labelPrimary.font.size = config.style.primaryFontSize


            if(config.marketDetails.isSuspended = true)
                  ' obj = CreateObject("roSgNode", "lockedOdds")
                  ' m.top.appendChild(obj)
                  ' data = {
                  '       size: [width, height]
                  ' }
                  ' obj.configdata = data
            else
                  animateProp(config, width, height)
            end if

       end if

end sub



sub animateProp(config as object, width, height)

      if(config.streamAnim = "up")
            anim = CreateObject("roSGNode", "animationInidicatorUp")
            m.top.appendChild(anim)
            anim.translation = [width - 25, (height / 2) - 5]
      else if config.streamAnim = "down"
            anim = CreateObject("roSGNode", "animationInidicatorDown")
            m.top.appendChild(anim)
            anim.translation = [width - 25, (height / 2) - 5]
      end if

end sub