sub init()

      m.top.itemComponentName = "simpleBoxItems"
      m.top.drawFocusFeedback = true
      m.top.observeField("rowitemFocused", "onItemFocused")
      m.top.numColumns = 1
      m.top.numRows = 5
      m.top.itemSize = [150*3, 70]
      m.top.rowItemSize = [[70,70], [70,70]]
      m.top.rowHeights = [70,70,70]
      m.top.itemSpacing = [0, 0]
      m.top.rowItemSpacing = [[0, 0]]
      m.top.vertFocusAnimationStyle = "fixedFocus"
      m.top.rowFocusAnimationStyle = "floatingFocus"
      m.top.showRowLabel = [false]
      m.top.rowLabelColor = "0xa0b033ff"



      showmarkupgrid()

end sub

sub onItemFocused()
? "iterm focused" m.top.itemFocused
row = m.top.rowItemFocused[0]
col = m.top.rowItemFocused[1]
print "Row Focused: " + stri(row)
print "Col Focused: " + stri(col)
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

      m.y = 0
      m.sizes = []
      array = ["Spread", "MoneyLine", "Total", "Over 3.5", "Under 3.5", "Test", "MoneyLine", "Over 3.5", "Test", "Spread", "Test", "Spread"]
      'Populate the RowList content here
      data = CreateObject("roSGNode", "ContentNode")
      m.widthseqnece = []
      i = CreateObject("roInt")
      ' for numRows = 0 to 7
     


      ' end for

      data = CreateObject("roSGNode", "ContentNode")
      for numRows = 0 to 3
          row = data.CreateChild("ContentNode")
              row.title = "Row " + stri(numRows)
            
              
              jumpo = 2
              width= 70
              if(numRows = 3 or numRows = 2) then 
                  jumpo = 1
                  width = 140
            endif
            m.sizes.push([150,70])
          for i = 0 to jumpo           
              item = row.CreateChild("oddsBodyContent")            
              item.num = i
              if i =0 then 
                  s= 150 
              else s= 70 
              endif
              item.width = s
            
          end for
      end for

    
      m.top.rowItemSize = m.sizes
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
