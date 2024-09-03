sub init()

      ? m.top.boundingRect()

      rect = m.top.boundingRect()

      ?"widgetRoot" m.top.localBoundingRect()

      m.headerText = m.top.findNode("embetOddsHeaderText")
      m.root = m.top.findNode("embetOddsRoot")
      m.list = m.top.findNode("embetOddsList")
      rect2 = m.headerText.boundingRect()

      ' node.translation = [rect2.width/2 , rect2.height/2 + 10]
      m.headerText.width = rect.width / 2 - 50
      x = rect.width / 2

      m.headerText.translation = [x, 0]

      m.top.translation = [1920 - 500, 200]

      ?"rect2 =" rect2



      m.buttoinUI2 = CreateObject("roSGNode", "ButtonExample")
      m.top.appendChild(m.buttoinUI2)
      m.buttoinUI2.translation = [-470, 250]

      m.root.opacity = 0.9

      ?"UI buttonUI2" m.buttoinUI2.boundingRect()
      ?"UI embet" m.root.boundingRect()

      m.top.observeField("focusedChild", "onFocusedChildChange")

      initLibrary()

end sub

sub onFocusedChildChange()
      ?"init on something focused"

      if m.top.focusedChild = invalid
            ?"sending event unfocused"
            m.top.focusChanged = "unfocused"
            m.buttoinUI2.setFocus(true)
      else
            ?"sending event focused"
            m.top.focusChanged = "focused"
            ' m.list.setfocus(true)
      end if
end sub


sub initLibrary()
      m.bcLib = createObject("roSGNode", "ComponentLibrary")
      m.bcLib.id = "QRCodelib"
      m.bcLib.uri = "pkg:/components/lib/rokutest.zip"
      m.bcLib.observeField("loadStatus", "onLoadStatus")
      m.top.appendChild(m.bcLib)



end sub

sub onFocusChange()

      ?"i am focused"
end sub

sub onLoadStatus(ev)
      status = ev.getData()
      if status = "ready" then
            ?"Load lib ready"
            m.bcPlayer = createObject("roSGNode", "QrCodeLib:qrCode")
            m.bcPlayer.text = "wqeqwewqewqeqwwwwwewqe"
            ' m.top.appendChild(m.bcPlayer)

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
      ?"focus = " key, press
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

