


sub init()
  m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"

  m.top.setFocus(true)
  addtimer()

  m.markupgrid = m.top.findNode("exampleMarkupGrid")
  m.embet = m.top.findNode("embetOddsList")

  ?"Fields grid = " m.markupgrid

  m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
  m.readMarkupGridTask.contenturi = "http://www.sdktestinglab.com/Tutorial/content/rendergrid.xml"
  m.readMarkupGridTask.observeField("content", "showmarkupgrid")
  m.readMarkupGridTask.control = "RUN"
end sub

sub showmarkupgrid()
  m.markupgrid.content = GetRowListContent()
end sub


function GetRowListContent() as object

  array = ["Spread", "MoneyLine", "Total", "Over 3.5", "Under 3.5", "Test", "MoneyLine", "Over 3.5", "Test", "Spread", "Test", "Spread"]
  'Populate the RowList content here
  data = CreateObject("roSGNode", "ContentNode")
  for numRows = 1 to 12
        item = data.CreateChild("oddsBodyContent")
        item.marketName = array.getEntry(numRows)
        item.teamAwayOdds = "255" + stri(numRows)
        item.teamHomeOdds = stri(numRows)
        item.num = numRows

?"Row number = " numRows

        if(numRows =  5 or numRows = 2 or numRows = 8 or numRows = 11) then
          item.width = 250
             item.teamHomeOdds = array.getEntry(numRows mod 5)
        else
          item.width = 70
        endif 
       
        if(numRows > 3) then
              item.type = "vertical"
        else
              item.type = "horizontal"
        end if

  end for

  return data
end function



sub addTimer()
  m.timer = createObject("roSGNode", "Timer")
  m.timer.id = "timer"
  m.timer.repeat = false
  m.timer.duration = 5
  m.timer.ObserveField("fire", "onTimer")

end sub


function onKeyEvent(key as string, press as boolean) as boolean
handled = true
?" "
?" on key event button example focus = " key, press

if(key = "left" and press = true) then
    node = m.global.findNode("embetOddsList")
    node.setFocus(true)
 
else 

    handled = true
end if


return handled
end function

sub onTimer()

end sub


