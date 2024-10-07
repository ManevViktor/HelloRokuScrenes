sub init()
      m.global.addFields({ embetSDK: { debug: false } })

      logEvent({ key: "m.top.rect", value: m.top.boundingRect() })

      rect = m.top.boundingRect()

      logEvent({ key: "widgetRoot", value: m.top.localBoundingRect() })


      ' initLibrary2()

      ' initLibrary()

      m.headerText = m.top.findNode("embetOddsHeaderText")
      m.root = m.top.findNode("embetOddsRoot")
      m.list = m.top.findNode("embetOddsList")
      m.sectionlist = m.top.findNode("embetSectionsList")
      m.headerRect = m.top.findNode("embetOddsHeader")
      m.bodyRect = m.top.findNode("embetOddsBodyInfo")
      m.oddsRect = m.top.findNode("oddsListRect")
      m.bodyTitle = m.top.findNode("embetOddsInformation")
      m.oddsListItems = m.top.findNode("embetOddsList")
      rect2 = m.headerText.boundingRect()



      '      m.clippingRect = rect

      m.headerText.width = rect.width / 2 - 50
      x = rect.width / 2
      m.headerText.translation = [x, 0]

      logEvent({ key: "rect headerText", value: rect2 })

      m.root.opacity = 1
      logEvent({ key: "UI embet root", value: m.root.boundingRect() })

      m.top.observeField("focusedChild", "onFocusedChildChange")

      di = CreateObject("roDeviceInfo")
      size = di.GetDisplaySize()


      m.top.observeField("size", "onSizeChanged")

      showmarkupgrid(false)
      ' addTimer()
      initPubnubLib()

end sub


sub onPuBnubUpdate(event as object)
      ?"emb sec : event update pubnub"
      ?"m.parent"
      m.updatecontent = event.getData()

      m.parentot = m.top.getChild(0) .getChild(2)

      newMarkupgrid = CreateObject("roSgNode", "embetSections")
      newMarkupgrid.id = "embetSectionsList"
      newMarkupgrid.jsonData = m.updatecontent

      ?"index = "findChildIndex("embetSectionsList")

      m.parentot.replaceChild(newMarkupgrid, 0)
      newMarkupgrid.setfocus(true)
      newMarkupgrid.jumpToItem = 5

     addTimer()

'      TO add focused index and 

      ' m.top.appendChild(newMarkupgrid)
      ' newMarkupgrid.translation = [-400, 0]

end sub

function findChildIndex(newdata as dynamic) as integer

      topcount = m.top.getChildCount()

         ' while(m.sectionlist.content.getChildCount() > 0)
      '       m.sectionlist.content.removeChildIndex(0)
      ' end while


      ?m.sectionlist

      index = 0
      for p = 0 to topcount - 1
            if(m.top.getChild(p)).id = newData
                  index = p
            end if
      end for

      return index

end function

sub onNewData(e as object)
      ?"task comepletec " e.getData()

      root = e.getData()

       m.sectionlist.jsonData = root

       ?"child 0 = "m.top.getChild(0).subtype()
       ?""
       ?""
       ?"child 12" m.top.getChild(0).getChild(2).subtype()
end sub

sub showmarkupgrid(extend as boolean)
      ' content = GetRowListContent()
      uri = ""
      if(extend = true) then
            uri = "pkg:/components/file/marketextend.json"
      else
            uri = "pkg:/components/file/market.json"
      end if

      m.task = CreateObject("roSGNode", "JsonReader")
      m.task.observeField("dataContent", "onNewData")

      m.task.control = "run"

end sub

sub addTimer()
      m.timer = createObject("roSGNode", "Timer")
      m.timer.id = "timer"
      m.timer.repeat = false
      m.timer.duration = 5
      m.timer.ObserveField("fire", "onTimer")
      m.timer.control = "start"
end sub

sub onTimer()
      ' total = m.sectionlist.content.getChildCount() - 1

      ' for i = 0 to total
      '       m.sectionlist.content.removeChildIndex(i)

      ' end for

      ' m.sectionlist.content = ""
      ' m.task.control = "run"
     m.sectionlist.jsonData = m.updatecontent

end sub

sub onSizeChanged()
      m.root.width = m.top.size.w
      m.root.height = m.top.size.h

      redraw()
end sub

sub redraw()
      rect = m.top.boundingRect()
      m.headerRect.width = rect.width
      m.bodyRect.width = rect.width
      m.oddsRect.width = rect.width
      m.bodyTitle.width = rect.width
      m.oddsListItems.rowItemSize = [[rect.width, 50]]

      m.headerText.width = rect.width / 2 - 50
      x = rect.width / 2
      m.headerText.translation = [x, 0]

      m.oddsListItems.sizeChanged = { w: 500, h: 220 }

      m.global.addFields({ red: &hff0000ff, green: &h00ff00ff, blue: &h0000ffff })

end sub

sub onFocusedChildChange()
      ' if m.top.focusedChild = invalid
      '       ?"embet sending event unfocused"
      '       m.top.focusChanged = "unfocused"
      ' else
      '       if(m.oddsListItems.hasFocus() = false) then
      '             m.oddsListItems.setfocus(true)
      '       end if
      '       m.top.focusChanged = "focused"
      ' end if
end sub


sub initLibrary()
      m.bcLib = createObject("roSGNode", "ComponentLibrary")
      m.bcLib.id = "QRCodelib"
      m.bcLib.uri = "https://main--pocrokutest.netlify.app/4/qrcodes.zip"
      m.bcLib.observeField("loadStatus", "onLoadStatus")

end sub


sub onLoadStatus(ev)
      status = ev.getData()
      if status = "ready" then
            ?"Load lib ready"
            ?"mtop bound"m.top.boundingRect()
            m.bcPlayer = createObject("roSGNode", "QrCode:qrCode")
            m.bcPlayer.text = "wqeqwewqewqeqwwwwwewqe"
            m.bcPlayer.width = 400
            m.bcPlayer.height = 400
            m.bcPlayer.translation = [0, 120]
            m.top.appendChild(m.bcPlayer)


            ' m.bcLib = createObject("roSGNode", "Embet:MultibetWidget")
            ' Lib was successfully downloaded and all its components are now accessible

      else if status = "loading" then
            ?"Load lib Loading"

            ' bcLib package is currently being downloaded

      else if status = "failed" then
            ?"Load lib failed"
            ' Something went wrong with the bcLib download/load process.
            ' Please check if the package URL was properly set.

      end if
end sub




function onKeyEvent(key as string, press as boolean) as boolean
      handled = false
      m.keyPress = key
      ' ?"key event embet Root = " key, press
      ' if press
      '     if key = "up" or key = "down"
      '         if m.exampleButton1.hasFocus()
      '             m.exampleButton2.setFocus(true)
      '         else
      '             m.exampleButton1.setFocus(true)
      '         end if

      '         handled = true
      '     end if
      ' end if

      return handled
end function

' 1.Do you use scale
' 2.Focus management
' 3.Width and height