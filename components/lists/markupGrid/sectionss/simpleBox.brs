sub init()
      m.label = m.top.findNode("labelMarkup")
      m.label2 = m.top.findNode("lbldescripton")
      m.rect = m.top.findNode("rectMarkUp")
      m.layoutGrp = m.top.findNode("groupOutcomes")

      m.vertRoot = m.top.findNode("verticalOdds")
      m.nodes = node_types()

end sub


sub itemContentChanged()

      content = m.top.itemContent

      setSize(content)
      if(content.marketData <> invalid) then
            m.label.text = content.marketData.odds
            m.label2.text = content.marketData.description
      else
            m.label.text = content.text
            m.label.height = content.height
            m.label.vertAlign = "center"
            m.label.horizAlign = "left"
            m.layoutGrp.translation = [15, 0]
            ' m.label2.text = content.num


      end if

      ?"cell node type " content.nodeType

      m.label.font.size = 14
      m.label2.font.size = 12

      ' if(content.nodeType = "vteamName") then
      '   m.verRect.visible = true
      '   m.rect.visible = false
      ' else
      '       m.verRect.visible = false
      '       m.rect.visible = true
      ' endif

      
      if(content.nodeType = m.nodes.horizMarket) then
            m.label.text = content.nodeType
      else if(content.nodeType = m.nodes.vertMarket) then
            m.label.text = "vertikalata"
      end if

end sub


sub setSize(content as object)

      m.rect.width = content.width
      m.rect.height = content.height
      m.label.width = content.width
      m.label2.width = content.width

      m.layoutGrp.translation = [0, (content.height / 3) - content.height / 5]


      ' m.verRect.width = content.width

end sub