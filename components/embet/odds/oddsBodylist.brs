
function init()
      print "in SimpleRowListPanel init()"
      m.top.itemComponentName = "oddsListItem"
      m.top.numRows = 4
      m.top.itemSize = [400, 50]
      m.top.rowItemSize = [[400, 50]]
      m.top.showRowLabel = [false]
      m.top.translation = [0, 10]
      m.top.itemSpacing = [0, 2]
      m.top.rowFocusAnimationStyle = "floatingFocus"
      m.top.vertFocusAnimationStyle = "floatingFocus"
      m.top.content = GetRowListContent()
      m.top.ObserveField("rowItemFocused", "onRowItemFocused")
      m.top.visible = true

      m.top.ObserveField("sizeChanged", "onSizeChanged")

end function


sub onSizeChanged()
      m.top.width = 600
      m.top.itemSize = [500, 50]
      m.top.rowItemSize = [[500, 50]]
      ?"trrrigered on size change"
      m.top.itemComponentName = "oddsListItem"
      m.top.content = GetRowListContent2()
end sub

function GetRowListContent() as object

      array = ["Spread", "MoneyLine", "Total", "Over 3.5", "Under 3.5", "Test"]
      'Populate the RowList content here
      data = CreateObject("roSGNode", "ContentNode")
      for numRows = 0 to 5
            row = data.CreateChild("ContentNode")
            row.title = "hello" + stri(numRows)
            item = row.CreateChild("oddsBodyContent")
            item.marketName = array.getEntry(numRows)
            item.teamAwayOdds = "255" + stri(numRows)
            item.teamHomeOdds = stri(numRows)
            item.width = 250

      end for

      return data
end function



function GetRowListContent2() as object

      array = ["Test", "Test", "Total", "Test 3.5", "Under 3.5", "Test"]
      'Populate the RowList content here
      data = CreateObject("roSGNode", "ContentNode")
      for numRows = 0 to 5
            row = data.CreateChild("ContentNode")
            row.title = "hello" + stri(numRows)
            item = row.CreateChild("oddsBodyContent")
            item.marketName = array.getEntry(numRows)
            item.teamAwayOdds = "255" + stri(numRows)
            item.teamHomeOdds = stri(numRows)
            item.width = 500

            ?"global from list" m.global
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
      node = type(m.top)

      ?"embet key press = " key

      ' m.top.jumpToRowItem = [4, 0]
      if press = true then
            if node = "roSGNode" then
                  if key = "down"
                        if m.top.rowItemFocused[0] = 5 then
                              m.top.setfocus(false)
                        else
                              m.top.jumpToItem = m.top.itemFocused + 1
                        end if
                  else if key = "up"
                        if(m.top.itemFocused = 0) then
                              m.top.setfocus(false)
                        else
                              m.top.jumpToItem = m.top.itemFocused - 1
                        end if
                  else if key = "OK"
                        m.top.jumpToItem = 0
                  end if



                  handled = true
            end if

            if key = "left" then
                  m.top.setfocus(false)
            else if key = "right"
                  m.top.setfocus(false)
            end if

      end if




      ' ?getInterface(m.top, "ifRoSGNode") <> invalid
      ' ? m.top.currFocusRow
      ' ? m.top.itemFocused
      return handled
end function


