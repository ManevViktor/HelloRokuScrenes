sub init()

      ? m.top.boundingRect()

      rect = m.top.boundingRect()

      ?"widgetRoot" m.top.localBoundingRect()

      m.headerText = m.top.findNode("embetOddsHeaderText")
      m.root = m.top.findNode("embetOddsRoot")
      m.list = m.top.findNode("embetOddsList")
      m.headerRect = m.top.findNode("embetOddsHeader")
      m.bodyRect = m.top.findNode("embetOddsBodyInfo")
      m.oddsRect = m.top.findNode("oddsListRect")
      m.bodyTitle = m.top.findNode("embetOddsInformation")
      m.oddsListItems = m.top.findNode("embetOddsList")
      rect2 = m.headerText.boundingRect()


      m.headerText.width = rect.width / 2 - 50
      x = rect.width / 2
      m.headerText.translation = [x, 0]
      ?"rect2 =" rect2

      m.root.opacity = 1
      ?"UI embet" m.root.boundingRect()

      m.top.observeField("focusedChild", "onFocusedChildChange")

      di = CreateObject("roDeviceInfo")
      size = di.GetDisplaySize()

      ' initLibrary()

      m.top.observeField("size", "onSizeChanged")

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

      m.oddsListItems.sizeChanged = {w:500,h:220}

m.global.embet.size = rect
end sub

sub onFocusedChildChange()
      if m.top.focusedChild = invalid
            ?"embet sending event unfocused"
            m.top.focusChanged = "unfocused"
      else
            ?"embet sending event focused"
            m.top.focusChanged = "focused"
      end if
end sub


sub initLibrary()
      m.bcLib = createObject("roSGNode", "ComponentLibrary")
      m.bcLib.id = "QRCodelib"
      m.bcLib.uri = "pkg:/components/lib/rokutest.zip"
      m.bcLib.observeField("loadStatus", "onLoadStatus")

end sub


sub onLoadStatus(ev)
      status = ev.getData()
      if status = "ready" then
            ?"Load lib ready"
            m.bcPlayer = createObject("roSGNode", "QrCodeLib:qrCode")
            m.bcPlayer.text = "wqeqwewqewqeqwwwwwewqe"


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
      handled = true
      m.keyPress = key
      ?"key event embet Root = " key, press
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