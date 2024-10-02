sub init()

      m.rect = m.top.findNode("rectVertical")
      m.vertImg = m.top.findNode("posterodds")
      m.labelPrimary = m.top.findNode("vLabelTeam")
end sub

sub onNewWidth(evn as object)
      width = evn.getData().width

      m.labelPrimary.width = width
      m.rect.width = width
end sub