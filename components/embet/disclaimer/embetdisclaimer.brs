sub init()

      m.rootRect = m.top.findNode("bottomRectangle") 
      m.discTitle = m.top.findNode("discTitle")
      m.discLabel = m.top.findNode("discLabel")
      m.discCollassed = m.top.findNode("discCollassed")
      m.expandAnim = m.top.findNode("expandAnimation")
      m.collapseAnim = m.top.findNode("collapseAnimation")
      m.top.observeField("focusedChild", "onFocusChange")
      m.discLabel.font.size = 14
end sub

sub onFocusChange()

      ?"expand disclaimer"
      if(m.top.isInFocusChain())
            m.expandAnim.control = "start"
            m.rootRect.color="0xa9A9A94D"
      else
            m.collapseAnim.control = "start"
            m.rootRect.color="0x212121"
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