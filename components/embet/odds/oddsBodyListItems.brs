sub init()
      m.labelHome = m.top.findNode("labelHome")
      m.labelMarket = m.top.findNode("labelMarket")
      m.labelAway = m.top.findNode("labelAway")
      m.background = m.top.findNode("oddsHoriz")

      m.debugFlag = false
      font = 16
      m.labelHome.font.size = font
      m.labelMarket.font.size = font
      m.labelAway.font.size = font
end sub


sub itemContentChanged()

      if(m.debugFlag) then
            ?"heyyy" m.top
            rect = m.top.boundingRect()
            ?"priont from cell" rect
            ?"Get Global ="getGlobalAA().global
            ?""
            ?"m..global " m.global

      end if

      itemcontent = m.top.itemContent

      m.labelHome.text = itemcontent.teamHomeOdds
      m.labelMarket.text = itemcontent.marketName
      m.labelAway.text = itemcontent.teamAwayOdds
end sub