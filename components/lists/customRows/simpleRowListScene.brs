function init()
      m.theRowList = m.top.FindNode("theRowList")

      ' m.label = m.top.FindNode("exampleScrollableText")
       m.btn = m.top.FindNode("btn1")


      ' ' addTask()
      rect = CreateObject("roSGNode", "Rectangle")
      rect.width = 320
      rect.height = 750
      rect.color = "0x000000"

      sdk = {

            config: {
                  client: "",
                  id: ""
            }
            widgetSize: [410, 600]
      }



      m.global.addFields({ embetSDK: sdk })
      obj = m.global.getField("embetSDK")
      ' m.global.embetSDK.setField("debug". true)
      ?"obj get field" obj
      obj.hey = true
      m.global.setfield("embetSDK", obj)
      ?"m.global row list" m.global.embetSDK
      ?"m.global row" m.global

      ' m.sections = CreateObject("roSGNode", "embetSections")
      ' rect.translation = "[800,150]"

      er = CreateObject("rosgNode", "rectangleanimationScene")
      m.top.appendChild(er)
      er.translation = [900, 400]

      ' nodeFoucs = m.top.FindNode("exampleScrollableText22")

      '      er.setfocus(true)

      ' '  m.label.setfocus(true)
      ' m.top.appendChild(rect)

      ' rect.appendChild(m.sections)
      ' m.sections.setFocus(true)


      ' showmarkupgrid()


      ' rect2 = CreateObject("roSGNode", "maskScroll")
      ' m.top.appendChild(rect2)
      ' rect2.translation = [50,400]
      '  rect2.setFocus(true)
      addEmbet()
      '   nodeFoucs.setfocus(true)

      ' child = CreateObject("roSgNode", "animationInidicatorUp")
      ' m.top.appendChild(child)

end function


sub onNewData()

      '   m.embetData = event.getData()
      ' m.sections.jsonData = root
end sub

sub showmarkupgrid()
      ' content = GetRowListContent()

      m.task = CreateObject("roSGNode", "JsonReader")
      m.task.observeField("dataContent", "onNewData")
      ' m.task.control = "run"

end sub


sub time()

      m.timer = createObject("roSGNode", "Timer")
      m.timer.id = "timer"
      m.timer.repeat = true
      m.timer.duration = 10
      m.timer.ObserveField("fire", "onDataTimer")
      m.timer.control = "start"

end sub

sub onDataTimer()



      root = {}

      m.sections.content = root

end sub


sub addEmbet()

      m.embetUI = CreateObject("roSGNode", "embetRoot")
      m.top.appendChild(m.embetUI)
      m.embetUI.setfocus(true)
      m.embetUI.observeField("focusChanged", "onFocusChanged")

      di = CreateObject("roDeviceInfo")
      screenSize = di.GetDisplaySize()
      ' m.global.embetUI.addfields(screenSize)


      if screenSize <> invalid then
            ' For this POC the size of the widget is fixed for next release you will be able to change the size
            widgetWidth = 400
            widgetX = (screenSize.w - widgetWidth)
            padding = { x: 15, y: 15 }
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
      m.newLg.translation = [100, 100]

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

function onKeyEvent(key as string, press as boolean) as boolean

     
      if(press = true) then
             ?"keypress scene" key
            if(m.btn.hasFocus() = true) then
                  m.embetUI.setfocus(true)
            end if
      end if
      return true
end function

function onFocusChanged()
      if(m.embetUI.focusChanged = "unfocused") then
            m.btn.setfocus(true)
      end if
      ?" onFocusChanged" m.embetUI.focusChanged

end function