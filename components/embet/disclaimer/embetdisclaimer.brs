sub init()

      m.rootRect = m.top.findNode("bottomRectangle")
      m.discTitle = m.top.findNode("discTitle")
      m.discLabel = m.top.findNode("discLabel")
      m.discCollassed = m.top.findNode("discCollassed")
      m.expandAnim = m.top.findNode("expandAnimation")
      m.collapseAnim = m.top.findNode("collapseAnimation")
      m.imageChevron = m.top.findNode("embetChevron")
      m.top.observeField("focusedChild", "onFocusChange")

      m.discLabel.font.size = 14
      m.discTitle.font.size = 15
end sub

sub onFocusChange()


      if(m.top.isInFocusChain())
            m.expandAnim.control = "start"
            m.rootRect.color = "0xa9A9A94D"
            m.imageChevron.uri = "pkg:/images/chevron_down.png"
      else
            m.collapseAnim.control = "start"
            m.rootRect.color = "0x2121214D"
            m.imageChevron.uri = "pkg:/images/odds/chevron_up_white.png"
      end if

end sub


function onKeyEvent(key as string, press as boolean) as boolean
      handled = true

      if(key = "up" and press = true)
            m.top.focusShouldChange = "grid"
      else if(key = "back" and press = true)
            m.top.focusShouldChange = "lost"
      end if

      return handled
end function