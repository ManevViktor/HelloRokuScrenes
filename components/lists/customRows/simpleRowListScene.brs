function init()
      m.theRowList = m.top.FindNode("theRowList")

      ' addEmbet()
      ' addTask()

end function


sub addEmbet()

      m.embetUI = CreateObject("roSGNode", "embetRoot")
      m.top.appendChild(m.embetUI)
      m.embetUI.setfocus(true)
      m.embetUI.observeField("focusChanged", "onFocusChanged")

      di = CreateObject("roDeviceInfo")
      screenSize = di.GetDisplaySize()


      if screenSize <> invalid then
            ' For this POC the size of the widget is fixed for next release you will be able to change the size
            widgetWidth = 400*2
            widgetX = (screenSize.w - widgetWidth)
            padding = {x:10, y:10}
            m.embetUI.translation = [widgetx - padding.x, padding.y]
      end if
end sub

sub addTimer()
      m.timer = createObject("roSGNode", "Timer")
      m.timer.id = "timer"
      m.timer.repeat = false
      m.timer.duration = 5
      m.timer.ObserveField("fire", "onTimer")
      ' m.timer.control = "start"
end sub

sub addTask()
      taskUI = CreateObject("roSGNode", "simpletaskscene")
      ' m.top.appendChild(taskUI)

      m.buttoinUI2 = CreateObject("roSGNode", "ButtonExample")
      m.top.appendChild(m.buttoinUI2)
      m.buttoinUI2.translation = [600, 250]

      m.newLg = CreateObject("roSGNode", "layoutGroupsTest")
      m.top.appendChild(m.newLg)
      m.newLg.translation = [100,100]
     
end sub

sub onTimer()
      di = CreateObject("roDeviceInfo")
      screenSize = di.GetDisplaySize()
      if screenSize <> invalid then
            widgetSize = { w: screenSize.w / 4, h: screenSize.h }
            widgetX = (screenSize.w - widgetSize.w) - 50
            m.embetUI.translation = [widgetX - 50, 50]
            m.embetUI.size = widgetSize
      end if
end sub



function onFocusChanged()
      ?" onFocusChanged" m.embetUI.focusChanged
      ' return focus to your own components

end function