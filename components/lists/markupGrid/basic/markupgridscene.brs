


sub init()
  m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"


  ' addtimer()

  ' m.btn = m.top.findNode("btn1")

  m.grid = m.top.findNode("exampleMarkupGrid")
  ' m.embet = m.top.findNode("embetOddsList")

  ' m.addNode = m.top.findNode("embetBodyUI")

  ' m.fopcusNode = m.top.findNode("lgFocus")

  ' ' m.vertGrtid = CreateObject("roSGNode", "MarkupGridVertical")
  ' ' m.addNode.appendChild(m.vertGrtid)
  ' ' m.vertGrtid.content = GetRowListContent()

  ' ' m.vertGrtid.setFocus(True)
  ' getTestConent()
  ' m.grid.ObserveField("itemFocused", "onRowItemFocused")
  ' m.readgridTask = createObject("roSGNode", "JsonReader")
  ' m.readgridTask.observeField("content", "showgrid")
  ' m.readgridTask.control = "RUN"


  m.grid.setFocus(true)

end sub

sub showmarkupgrid()
  content = GetRowListContent()
  listWidths = []

  for i = 0 to content.getChildCount() - 1
    listwidths.push(content.getChild(i).width)
  end for
  ?"list widths" listWidths
  m.grid.columnWidths = listWidths
  m.grid.content = content

end sub


sub onRowItemFocused()
  ?"send analytics event"
  m.grid.content.getChild(1).marketName = (Rnd(10).TOstr())
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
        item.focusable = false
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

  return handled
end function

function shouldFocus() as integer

  ' seleceted = m.
  return 1

end function

sub onTimer()
  ?"on timer"
  m.grid.content.getChild(1).marketName = "vice"
end sub


