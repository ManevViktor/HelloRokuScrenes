sub init()

      m.verRect = m.top.findNode("rectVertical")
      m.vertImg = m.top.findNode("posterodds")
      m.vertlbl = m.top.findNode("vLabelTeam")
end sub

sub onNewWidth(evn as object)
      width = evn.getData().width
      m.vertlbl.width = width
      m.verRect.width = width
end sub