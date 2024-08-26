
function init()
      print "in SimpleRowListPanel init()"
      m.top.itemComponentName = "oddsListItem"
      m.top.numRows = 4
      m.top.itemSize = [400, 50]
      m.top.rowItemSize = [[400, 50], [400, 50], [400, 50], [400, 50]]
      m.top.showRowLabel = [false]
      m.top.translation = [0, 10]
      m.top.itemSpacing = [0, 2]
      m.top.rowFocusAnimationStyle = "floatingFocus"
      m.top.content = GetRowListContent()
      m.top.ObserveField("rowItemFocused", "onRowItemFocused")
      m.top.visible = true
      m.top.setFocus(true)

end function


function GetRowListContent() as object
      'Populate the RowList content here
      data = CreateObject("roSGNode", "ContentNode")
      for numRows = 0 to 5
            row = data.CreateChild("ContentNode")
            row.title = "hello" + stri(numRows)
            item = row.CreateChild("oddsBodyContent")
            item.marketName = "market"
            item.teamAwayOdds = "255" + stri(numRows)
            item.teamHomeOdds = stri(numRows)

      end for

      return data
end function



function onRowItemFocused() as void
      row = m.top.rowItemFocused[0]
      col = m.top.rowItemFocused[1]
      print "Row Focused: " + stri(row)
      print "Col Focused: " + stri(col)
end function

function onKeyEvent(key as string, press as boolean) as boolean
      handled = false
      ?"key press" key "  " press
      node = type(m.top)
      ?"type = " node

      ' m.top.jumpToRowItem = [4, 0]
      if node = "roSGNode" and press = true then
            if key = "down"
                  m.top.jumpToItem = m.top.itemFocused + 1
            else if key = "up"
                  m.top.jumpToItem = m.top.itemFocused - 1

            else if key = "OK"
                  m.top.jumpToItem = 0
            end if

            

            handled = true
      end if

      if key = "left" then
            m.global.findNode("")
      end if


      ?getInterface(m.top, "ifRoSGNode") <> invalid
      ? m.top.currFocusRow
      ? m.top.itemFocused
      return handled
end function


