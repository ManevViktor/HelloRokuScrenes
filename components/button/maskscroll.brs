sub init()

      m.maskata = m.top.findNode("scrollview")
      m.group = m.top.findNode("fullysaturatedcolors")
      m.exampleButton1 = m.top.findNode("exampleButton1")
      m.exampleButton2 = m.top.findNode("exampleButton2")
      m.exampleButton3 = m.top.findNode("exampleButton3")
      m.exampleButton4 = m.top.findNode("exampleButton4")
      m.exampleButton5 = m.top.findNode("exampleButton5")

      m.count = 0
      m.offset = 0

      m.array = [m.exampleButton1, m.exampleButton2, m.exampleButton3, m.exampleButton4, m.exampleButton5]
end sub


function onKeyEvent(key as string, press as boolean) as boolean
      handled = true

      if(key = "down" and press = true) then
            m.count++
            m.offset -= 60
      else if(key = "up" and press = true) then
            m.count--
            m.offset += 60
      end if



      if(m.count < 0 or m.count > 4) then
            handled = false
      else
            m.array[m.count].setFocus(true)
            ' m.maskata.maskOffset = [0, m.offset]
             m.group.translation = [0, m.offset]
             m.maskata.maskOffset = [0, 60]

            handled = true
      end if
      return handled
end function