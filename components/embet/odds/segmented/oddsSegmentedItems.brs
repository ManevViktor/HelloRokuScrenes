sub init()
      m.horRect = m.top.findNode("rectMarkUp")
      m.horlabel = m.top.findNode("labelMarkup")
      m.vertPoster = m.top.findNode("marketVertPoster")
      m.vertOutcome = m.top.findNode("mvertoutcome")
      m.vertLabel = m.top.findNode("marketVertTeam")
end sub


sub itemContentChanged()

      con = m.top.itemContent

      if(con.nodeType = "Image") then
            m.horRect.visible = false
            m.vertPoster.visible = true
            m.vertPoster.width = con.width
            m.vertLabel.visible = false
            m.vertOutcome.visible = false

      else if(con.nodeType = "teamName") then
            m.horRect.visible = false
            m.vertPoster.visible = false
            m.vertLabel.visible = true
            m.vertLabel.width = con.width
            m.vertOutcome.visible = false


      else if(con.nodeType = "outcome") then
            m.horRect.visible = true
            m.vertPoster.visible = false
           
            m.vertLabel.visible = false
            m.vertOutcome.visible = false

            m.horlabel.text = con.teamHomeOdds
            m.horRect.width = con.width
            m.horlabel.width = con.width

      else if(con.nodeType = "market") then
            m.horRect.visible = true
            m.vertPoster.visible = false
            m.vertLabel.visible = false
            m.vertOutcome.visible = false

            m.horlabel.text = con.marketName
            m.horRect.width = con.width
            m.horlabel.width = con.width


      end if

      if(con.nodeType = "verticalImage") then


      end if
end sub

sub loadJSONFile()

      json = ParseJson(ReadAsciifile("pkg:/file/file.json"))
end sub