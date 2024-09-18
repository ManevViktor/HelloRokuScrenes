


sub init()
  m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"


  addtimer()

  m.btn = m.top.findNode("btn1")

  m.grid = m.top.findNode("exampleMarkupGrid")
  m.embet = m.top.findNode("embetOddsList")

  m.addNode = m.top.findNode("embetBodyUI")

  m.fopcusNode = m.top.findNode("lgFocus")


  showmarkupgrid()
  m.vertGrtid = CreateObject("roSGNode", "MarkupGridVertical")
  m.addNode.appendChild(m.vertGrtid)
  m.vertGrtid.content = GetRowListContent()

  ' m.vertGrtid.setFocus(True)
  getTestConent()
  m.grid.ObserveField("itemFocused", "onRowItemFocused")
  m.readgridTask = createObject("roSGNode", "JsonReader")
  ' m.readgridTask.observeField("content", "showgrid")
  m.readgridTask.control = "RUN"
  
  
  m.grid.setFocus(true)
end sub

sub showmarkupgrid()
  content = GetRowListContent()
  listWidths = []

  for i = 0 to content.getChildCount()-1
    listwidths.push(content.getChild(i).width)
  endfor  
 ?"list widths" listWidths
'  m.grid.columnWidths = listWidths
  m.grid.content = content

end sub


sub onRowItemFocused()
?"send analytics event"
endsub

function GetRowListContent() as object

  array = ["Spread", "MoneyLine", "Total", "Over 3.5", "Under 3.5", "Test", "MoneyLine", "Over 3.5", "Test", "Spread", "Test", "Spread"]
  'Populate the RowList content here
  data = CreateObject("roSGNode", "ContentNode")
  for numRows = 0 to 30


    item = data.CreateChild("oddsBodyContent")
    item.marketName = array[numRows]
    item.teamAwayOdds = "255" + stri(numRows)
    item.teamHomeOdds = stri(numRows)
    item.num = numRows

    item.focusable = false
    modus = numRows mod 3

    '  if("horizontal")
    if(numRows <= 8) then
      if(modus = 1) then
        item.nodeType = "market"
        item.teamHomeOdds = array.getEntry(numRows mod 5)
        item.teamAwayOdds = array.getEntry(numRows mod 3)
        item.width = 250
        item.focusable = false
      else
        item.nodeType = "outcome"
        item.width = 70
        item.focusable = true
      end if

      item.type = "horizontal"

    else
      if(modus = 0) then
        item.nodeType = "Image"
        item.width = 30
      else if(modus = 1) then
        item.nodeType = "teamName"
        item.width = 300
      else
        item.nodeType = "outcome"
        item.width = 70
      end if

    end if

  end for

  return data
end function

function getTestConent() as object



end function

sub addTimer()
  m.timer = createObject("roSGNode", "Timer")
  m.timer.id = "timer"
  m.timer.repeat = false
  m.timer.duration = 5
  m.timer.ObserveField("fire", "onTimer")

end sub


function onKeyEvent(key as string, press as boolean) as boolean
  handled = false
  ?" "

  ?" on key event markupGrid focus = " key, press

  if(key = "left" and press = true) then
     itemS = m.grid.itemFocused-1

     focusable = m.grid.content.getChild(itemS)
     if(focusable) then
      handled = true
      else
      m.grid.animateToItem = 4 

    endif

  else if(key = "ok") then

    handled = true
  end if


  return handled
end function

function shouldFocus() as integer
 
  ' seleceted = m.
 return 1

 endfunction 

sub onTimer()

end sub


