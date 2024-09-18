sub init()

      m.top.itemComponentName = "verticalItemsGrid"
      m.top.numColumns = 1
      m.top.numRows = 3
      m.top.itemSize = [400, 60]
      m.top.rowHeights = [60, 60, 60]
      m.top.itemSpacing = [0, 10]
      m.top.columnWidths = [400]
      m.top.drawFocusFeedback = true
      m.top.wrapDividerHeight = 0
      m.top.vertFocusAnimationStyle = "floatingFocus"
      m.top.focusFootprintBlendColor = "0x000000"
      m.top.focusBitmapBlendColor = "0xffffff"

      m.nodem = m.global.findNode("exampleMarkupGrid")

end sub


' function onKeyEvent(key as string, press as boolean) as boolean
'       handled = true
'       ?
'       ?" "
'       ?" on key event button example focus = " key, press

'       if(key = "left" and press = true) then
'             m.nodem.setFocus(true)
'             m.nodem.jumptoitem = 6
'             handled = true
'       else if(key = "up" and press = true) then
'             if(m.top.currFocusRow = 0) then
'                   m.nodem.setFocus(true)
'                   ' if(getInterface(m.nodem, "ifRoSGNode") <> invalid) then 
'                   '       ?"print true"
'                   ' m.nodem.jumpToItem(12)
'                   ' end if
'                   handled = true
'             end if
'       else if(key = "ok" and press = true)
'             m.top.jumptoitem= 6
'             handled = true

'      else 
'       handled = false       
'       end if


'       return handled
' end function

sub onTimer()

end sub
