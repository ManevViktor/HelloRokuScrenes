sub init()
      m.rect = m.top.findNode("rectRoot")
      m.labelPrimary = m.top.findNode("labelPrimary")

end sub

sub onDataUpdate(evn as object)
      ?"content =" evn.getData()
end sub

sub cellConfig(evn as object)

      ?"config ="  evn.getData().size
      config = evn.getData()


      m.rect.width = config.size[0]
      m.rect.height = config.size[1]
      m.labelPrimary.width = config.size[0]
      m.labelPrimary.height = config.size[1]

end sub