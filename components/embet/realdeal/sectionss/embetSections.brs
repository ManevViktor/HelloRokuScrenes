sub init()

      m.top.id = "markupEmbet"
      m.top.itemComponentName = "simpleBoxItems"
      m.top.numColumns = 3
      m.top.numRows = 8
      m.top.itemSize = [50, 50]
      m.top.itemSpacing = [0, 5]
      m.top.wrapDividerHeight = 0

      m.top.drawFocusFeedback = true
      m.top.drawFocusFeedbackOnTop = true
      m.top.focusBitmapUri = "pkg:/images/focusblend.9.png"
      m.top.vertFocusAnimationStyle = "floatingFocus"
      m.top.fixedLayout = true
      m.top.observeField("itemFocused", "onItemFocused")


      ?"mblobal size =  "m.global.embetSDK.widgetSize
      ?"mblobal debug" m.global.embetSDK

      m.top.configCache = {}
      m.nodeList = node_types()


      ' showmarkupgrid()
      ' initLibrary2()

end sub

sub jsonUpdate(evn as object)

      history = m.top.historyData
      content = parseEmbetContent(evn.getData(), history)
      m.top.content = content

end sub

' sub oneventPBnubUpdate(event as object)
'       ?"emb sec : event update pubnub"
'       ?"m.parent"
'      content = parseEmbetContent( event.getData())
'      m.top.content = invalid
'      m.top.content = content

'      newMarkupgrid = CreateObject("roSgNode","embetSections")
'      newMarkupgrid.content = content
'      m.top.replaceChild(newMarkupgrid, 0)
' end sub

sub onItemFocused()
      ?"on item focused " m.top.itemFocused
      if(m.top.itemFocused = 0) then m.top.jumptoitem = 1

      if(m.top.content <> invalid)
            ' ?"content num = "m.top.content.getChild(m.top.itemFocused).text
      end if

      m.top.configCache.focused = m.top.itemFocused
      m.top.configCache.hasFocus = true

end sub

sub onNewData(event as object)

      ' m.embetData = event.getData()
      ' content = parseEmbetContent(m.embetData)

      ' m.top.content = content

      ' m.s = CreateObject("RoSGNode", "disclaimer")
      ' ' m.top.appendChild(m.s)
      ' rect = m.top.boundingRect()

      ' ' text = m.top.findNode("txtDis")
      ' ' text.font.size = 13
      ' m.s.translation = [0, rect.height + 15]
      ' ?"rect = " m.top.boundingRect
end sub

sub showmarkupgrid()
      ' content = GetRowListContent()

      task = CreateObject("roSGNode", "JsonReader")
      task.control = "run"
      task.observeField("dataContent", "onNewData")
      ' listWidths = []

      ' for i = 0 to content.getChildCount() - 1
      '       listwidths.push(content.getChild(i).width)
      ' end for
      ' ?"list widths" listWidths
      '  m.grid.columnWidths = listWidths
      ' m.top.content = content

end sub



function GetRowListContent() as object

      m.y = 0
      array = ["Spread", "MoneyLine", "Total", "Over 3.5", "Under 3.5", "Test", "MoneyLine", "Over 3.5", "Test", "Spread", "Test", "Spread"]
      'Populate the RowList content here
      data = CreateObject("roSGNode", "ContentNode")
      m.widthseqnece = []
      i = CreateObject("roInt")
      ' for numRows = 0 to 7
      '       item = data.CreateChild("oddsBodyContent")
      '       item.num = numRows
      '       i.setInt( numRows / 3)
      '        if(numRows =4) then
      '             item.W = 2
      '             item.X = numRows mod 3
      '             item.Y = i.getint()
      '        else if(numRows = 5)
      '             item.W = 1
      '             numRows+=1
      '             i.setInt( numRows / 3)
      '             item.Y = i.getint()
      '             item.X = (numRows mod 3)

      '        else
      '             item.X = numRows mod 3
      '             item.W = 1
      '             item.Y = i.getint()
      '       endif

      '        item.H = 1
      '        ?"x , y  =[" item.X "," item.Y "]"




      ' end for

      item = data.CreateChild("oddsBodyContent")
      item.W = 1
      item.H = 1
      item.X = 0
      item.Y = 0
      item.text = "150"
      item.num = 0
      item.width = 70


      item = data.CreateChild("oddsBodyContent")
      item.W = 1
      item.H = 1
      item.X = 1
      item.Y = 0
      item.num = 1
      item.text = "190"
      item.width = 70



      item = data.CreateChild("oddsBodyContent")
      item.W = 1
      item.H = 1
      item.X = 2
      item.Y = 0
      item.num = 2
      item.width = 70
      item.text = "190"


      item = data.CreateChild("oddsBodyContent")
      item.W = 3
      item.H = 1
      item.X = 0
      item.Y = 1
      item.num = 0
      item.text = "190"
      item.width = 220

      item = data.CreateChild("oddsBodyContent")
      item.W = 2
      item.H = 1
      item.X = 0
      item.Y = 2
      item.num = 0
      item.width = 140

      item.market = ""

      item = data.CreateChild("oddsBodyContent")
      item.W = 1
      item.H = 1
      item.X = 2
      item.Y = 2
      item.num = 5
      item.width = 70



      item = data.CreateChild("oddsBodyContent")
      item.W = 2
      item.H = 1
      item.X = 0
      item.Y = 3
      item.num = 6
      item.width = 140


      item = data.CreateChild("oddsBodyContent")
      item.W = 1
      item.H = 1
      item.X = 2
      item.Y = 3
      item.num = 7
      item.width = 70
      item.text = "qnuID"



      item = data.CreateChild("oddsBodyContent")
      item.W = 3
      item.H = 1
      item.X = 0
      item.Y = 4
      item.num = 8
      item.width = 270

      item = data.CreateChild("oddsBodyContent")
      item.W = 2
      item.H = 1
      item.X = 0
      item.Y = 5
      item.num = 0
      item.width = 140


      item = data.CreateChild("oddsBodyContent")
      item.W = 1
      item.H = 1
      item.X = 2
      item.Y = 5
      item.num = 0
      item.width = 70


      rects = [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2]]

      for j = 0 to data.getChildCount() - 1

            ?"x , y = ["data.getChild(j).X data.getChild(j).Y "]"
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

function shouldFocus(key as string) as dynamic

      return invalid
end function


function getNextFocusIndex(key as string) as integer
      selectedIndex = m.top.itemFocused
      childCount = m.top.content.getChildCount()
      selectedchild = m.top.content.getChild(selectedIndex)

      ?"item focused =" selectedIndex
      return selectedIndex
end function



function onKeyEvent(key as string, press as boolean) as boolean
      handled = false

      if(key = "down" and press = true) then
            handled = true
            jump = navigateDown()
            ' ?"jump equqs" jump

            if(jump <> invalid and jump > 0)
                  m.top.jumptoitem = m.top.itemFocused + jump
            else
                  m.top.focusShouldChange = "disc"
            end if

      else if(key = "up" and press = true) then
            handled = true
            jump = navigateUp()
            if(jump <> invalid and jump > 0) then
                  ?"jump = " jump
                  m.top.jumptoitem = m.top.itemFocused - jump
            else
                  m.top.focusShouldChange = "lost"
            end if

      else if(key = "left" and press = true) then
            handled = true
            jump = navigateLeft()
            if(jump <> invalid)
                  m.top.jumptoitem = m.top.itemFocused - jump
            end if

      else if(key = "right" and press = true) then
            handled = true
            jump = navigateRight()
            if(jump <> invalid)
                  m.top.jumptoitem = m.top.itemFocused + jump
            end if

      else if(key = "back" and press = true)
            m.top.focusShouldChange = "lost"

      end if

      return handled
end function


sub onTimer()

end sub
