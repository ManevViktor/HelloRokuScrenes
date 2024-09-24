sub init()

      m.top.itemComponentName = "embetTestItem"
      m.top.numColumns = 3
      m.top.numRows = 10
      m.top.itemSize = [70, 50]
      m.top.rowHeights = [50]
      m.top.itemSpacing = [5, 5]
      m.top.columnWidths = [70, 70, 70]
      m.top.drawFocusFeedback = true
      
      m.top.fixedLayout = false
      m.top.sectionDividerWidth = 400.0
      m.top.sectionDividerHeight = 50.0
      m.top.sectionDividerFont = "font:MediumBoldSystemFont"
      m.top.sectionDividerTextColor = "0xffffff"
       m.top.sectionDividerbitmapURI = ""
       m.top.wrapDividerHeight = 500
       m.top.wrapDividerOpacity = 1.0



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

      m.y = 0
      array = ["Spread", "MoneyLine", "Total", "Over 3.5", "Under 3.5", "Test", "MoneyLine", "Over 3.5", "Test", "Spread", "Test", "Spread"]
      'Populate the RowList content here
      data = CreateObject("roSGNode", "ContentNode")
      m.widthseqnece = []
      i = CreateObject("roInt")

      m.section = data.CreateChild("oddsBodyContent")
      m.section.contentType = "SECTION"
      m.section.TITLE = "heyy"
      m.section.width = 400
      m.section.color = "0x000000"

      for numRows = 0 to 6


            m.section = data.CreateChild("oddsBodyContent")
            m.section.contentType = "SECTION"
            m.section.TITLE =  Stri(numRows)
            m.section.width = 400
            m.section.color = "0x000000"

            for i = 0 to 2
                  newitem =  m.section.CreateChild("oddsBodyContent")
                  newitem.color = "0x123212"
                  newitem.width = 70
                  newitem.num = i
            end for


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
