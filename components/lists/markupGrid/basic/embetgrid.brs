sub init()

      m.top.itemComponentName = "oddsSegmentedItems"
      m.top.numColumns = 3
      m.top.numRows = 10
      m.top.itemSize = [70, 50]
      m.top.rowHeights = [50]
      m.top.itemSpacing = [5, 5]
      m.top.columnWidths = [70, 250, 70]
      m.top.drawFocusFeedback = true
      m.top.vertFocusAnimationStyle = "floatingFocus"


      showmarkupgrid()

end sub

sub showmarkupgrid()
      content = GetRowListContent()
      ' listWidths = []

      ' for i = 0 to content.getChildCount() - 1
      '       listwidths.push(content.getChild(i).width)
      ' end for
      ' ?"list widths" listWidths
      '  m.grid.columnWidths = listWidths
      m.top.content = content

end sub


function GetRowListContent() as object

      array = ["Spread", "MoneyLine", "Total", "Over 3.5", "Under 3.5", "Test", "MoneyLine", "Over 3.5", "Test", "Spread", "Test", "Spread"]
      'Populate the RowList content here
      data = CreateObject("roSGNode", "ContentNode")
      m.widthseqnece = []
      for numRows = 0 to 30
            item = data.CreateChild("oddsBodyContent")
            item.marketName = array[numRows]
            item.teamAwayOdds = "255" + stri(numRows)
            item.teamHomeOdds = stri(numRows)
            item.num = numRows
            item.style = { fontSize: 14 }

            item.canFocus = false
            modus = numRows mod 3

            item.color = "0x123212"

            '  if("horizontal")
            if(numRows <= 8) then
                  if(modus = 1) then
                        item.nodeType = "market"
                        item.teamHomeOdds = array.getEntry(numRows mod 5)
                        item.teamAwayOdds = array.getEntry(numRows mod 3)
                        item.width = 250
                        item.color = "0x000000"
                  else
                        item.nodeType = "outcome"
                        item.width = 70
                        item.canFocus = true
                  end if

                  item.type = "horizontal"

            else
                  item.type = "vertical"
                  if(modus = 0) then
                        item.nodeType = "Image"
                        item.width = 50
                  else if(modus = 1) then
                        item.nodeType = "teamName"
                        item.color = "0x000000"
                        item.width = 270
                  else
                        item.canFocus = true
                        item.nodeType = "voutcome"
                        item.width = 70

                  end if

            end if

      end for

      return data
end function

function getTestConent() as object



end function

function getWidth(column as string) as integer

      val = 0
      if(column = "market") then
            val = 250
      else if(column = "outcome") then
            val = 70
      else if(column = "image") then
            val = 50
      else if(column = "teamName") then
            val = 270
      else if(column = "voutcome") then
            val = 70
      end if

      return val

end function

sub ok()
      obj = {}

      obj.width = 70
      obj.fontSize = 14
      obj.bgcolor = "0x000000"
      obj.textColor = "0xffffff"
end sub

function onKeyEvent(key as string, press as boolean) as boolean
      handled = true
      ?
      ?" on key event embet grid example focus = " key, press

      if(press = true) then
            m.top.jumptoItem = getFocusIndex(key)
      end if
      ' if(key = "left" and press = true) then

      '       if(focusable) then

      '             ' m.top.animateToItem = 0
      '       else
      '             ' m.top.animateToItem = 9

      '       end if
      ' else if(key = "up" and press = true) then
      '       if(m.top.currFocusRow = 0) then
      '             m.nodem.setFocus(true)
      '             ' if(getInterface(m.nodem, "ifRoSGNode") <> invalid) then
      '             '       ?"print true"
      '             ' m.nodem.jumpToItem(12)
      '             ' end if
      '             handled = true
      '       end if
      ' else if(key = "ok" and press = true)
      '       m.top.jumptoitem = 6
      '       handled = true

      ' else
      '       handled = false
      ' end if


      return handled
end function

function getFocusIndex(key as string) as integer
      nextIndex = m.top.itemFocused
      childCount = m.top.content.getChildCount()
      selectedchild = m.top.content.getChild(nextIndex)

      ?"item focused =" nextIndex
      if(key = "left") then

            if(selectedchild.type = "vertical") then
                  i = -1
            else
                  i = -1
            end if

            nextIndex -= 1
      else if(key = "right") then
            i = + 1
            nextIndex += 1
      else if(key = "up") then
            nextIndex -= 3
            i = -2
      else if(key = "down") then
            i = 2
            nextIndex += 3
      end if



      focusable = m.top.content.getChild(nextIndex).canFocus

      if(focusable = true)
            return nextIndex
      else return nextIndex + i
      end if

end function

sub onTimer()

end sub
