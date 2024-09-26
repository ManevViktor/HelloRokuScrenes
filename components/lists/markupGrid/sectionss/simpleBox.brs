sub init()
      m.label = m.top.findNode("labelMarkup")
      m.label2 = m.top.findNode("lbldescripton")
      m.rect = m.top.findNode("rectMarkUp")
      m.layoutGrp = m.top.findNode("groupOutcomes")
end sub


sub itemContentChanged()

      content = m.top.itemContent

      setSize(content)
      if(content.marketData <> invalid) then
            m.label.text = content.marketData.odds
            m.label2.text = content.marketData.description
      else
            m.label.text = content.text
            ' m.label2.text = content.num

      
      end if
     
      m.label.font.size = 14
      m.label2.font.size = 12


end sub


sub setSize(content as object)

      m.rect.width = content.width
      m.rect.height = content.height
      m.label.width = content.width
      m.label2.width = content.width

      m.layoutGrp.translation = [0, (content.height / 3) - content.height/5]

end sub