
function parseEmbetContent(jsondata as object) as object

      json = jsondata

      m.x = 0
      m.y = 0

      y = 0
      x = 0

      totalWidth = m.global.embetSDK
      ?"total width"

      widths = []
      heights = []

      nodesCollection = node_types()

      data = CreateObject("roSGNode", "ContentNode")
      j = 0
      for each market in json.betDetails
            j++

            if(j = 6) exit for

            ' "marketId": "sr:market:2",
            ' "presentation": "vertical",
            ' "marketName": "MONEYLINE",
            rowPos = 0
            present = getPresentationType(market)


            if(present = "horizontal") then
                  for i = 0 to 2
                        cell = data.CreateChild("oddsBodyContent")
                        cell.X = rowPos
                        cell.Y = y
                        cell.W = 1
                        cell.H = 1
                        cell.num = rowPos
                        cell.marketData = createCellData(market, i)
                        if(i = 1) then
                              ?"cell bound rect"
                              wid = 220
                              cell.text = "market"
                              cell.nodeType = nodesCollection.horizMarket
                        else
                              wid = 90
                              cell.text = "125"
                              cell.nodeType = nodesCollection.horizOdds
                        end if
                        cell.width = wid
                        cell.height = 50


                        widths.push(cell.width)
                        heights.push(cell.height)

                        rowPos++
                  end for
                  y++
            else
                  cell = data.CreateChild("oddsBodyContent")
                  cell.X = 0
                  cell.Y = y
                  cell.W = 3
                  cell.H = 1
                  cell.width = 410
                  cell.text = market.marketName
                  cell.nodeType = nodesCollection.vertMarket
                  y++


                  for kl = 0 to market.marketoptions.count() * 2 - 1

                        if(kl mod 2) = 1 then
                              cell = data.CreateChild("oddsBodyContent")
                              cell.X = 2
                              cell.Y = y
                              cell.W = 1
                              cell.H = 1
                              cell.width = 90
                              cell.nodeType = nodesCollection.vertOdds
                              cell.text = market.marketoptions[kl / 2].odds
                              cell.num = StrToI(market.marketoptions[kl / 2].description)
                              y++

                        else
                              cell = data.CreateChild("oddsBodyContent")
                              cell.X = 0
                              cell.Y = y
                              cell.W = 2
                              cell.H = 1
                              cell.width = 315
                              cell.nodeType = nodesCollection.vertDesciption
                              if(kl = 0) then
                                    cell.text = market.marketoptions[kl / 2].description
                              else
                                    cell.text = market.marketoptions[kl / 2].description
                              end if
                              cell.num = 120

                        end if

                  end for
            end if

      end for


      m.top.rowHeights = heights
      m.top.columnWidths = widths

      return data

end function


function getPresentationType(market as object) as dynamic

      if market.presentation <> invalid then
            return market.presentation
      else
            return "horizontal"
      end if

end function

function createCellData(market as object, index as integer) as object

      mdata = {}

      if(index = 0) then
            mdata = createHOutcomeCell(market, 0)
      else if(index = 1) then
            mdata = createHmarketCell(market, index)
      else if(index = 2)
            mdata = createHOutcomeCell(market, 1)
      end if

      return mdata
end function


function createHOutcomeCell(market as object, index as integer) as object
      mdata = {}
      teamStats = market.marketoptions.getEntry(index)
      if(teamStats <> invalid) then
            mdata.odds = teamStats.odds
            mdata.description = teamStats.description
            mdata.outcomeid = teamStats.outcomeId
            mdata.isSuspended = teamStats.isSuspended
            mdata.imageUrl = teamStats.imageUrl
      else
            mdata.isSuspended = true
      end if

      return mdata
end function


function createHmarketCell(market as object, index as integer) as object
      r = {}
      r.description = market.marketName
      return r
end function





' 00 10 20
' 01 11 21
' 02
' 03    25
' 04 14 24



function parseEmbetContentVert(data as object) as object

      json = m.embetData

      m.x = 0
      m.y = 0

      y = 0
      x = 0
      ?"jsopn" json

      widths = []
      heights = []

      data = CreateObject("roSGNode", "ContentNode")
      j = 0
      ' for each market in json.betDetails
      j++

      ' if(j = 6) exit for

      ' "marketId": "sr:market:2",
      ' "presentation": "vertical",
      ' "marketName": "MONEYLINE",
      heights = [60, 60]
      widths = [60, 190, 60]
      rowPos = 0


      deviationx = [0, 2, 0, 2, 0]

      deviationy = [0, 1, 1, 2, 2]

      devW = [3, 2, 1, 2, 1]


      ' x[i] = 2
      ' w[i] = 2
      ' y[i] = 1


      ' marketName
      cell = data.CreateChild("oddsBodyContent")
      cell.X = 0
      cell.Y = 0
      cell.W = 3
      cell.H = 1
      cell.width = 320
      cell.text = "teamName"



      ' teamhome
      cell2 = data.CreateChild("oddsBodyContent")
      cell2.X = 0
      cell2.Y = 1
      cell2.W = 2
      cell2.H = 1
      cell2.width = 240
      cell2.text = "teamName"

      ' outcome
      cell3 = data.CreateChild("oddsBodyContent")
      cell3.X = 2
      cell3.Y = 1
      cell3.W = 1
      cell3.H = 1
      cell3.width = 60
      cell3.text = "teamName"



      '  teamaway
      cell4 = data.CreateChild("oddsBodyContent")
      cell4.X = 0
      cell4.Y = 2
      cell4.W = 2
      cell4.H = 1
      cell4.width = 320
      cell4.text = "teamName"


      ' outcome
      cell5 = data.CreateChild("oddsBodyContent")
      cell5.X = 2
      cell5.Y = 2
      cell5.W = 1
      cell5.H = 1
      cell5.width = 60
      cell5.text = "teamName"

      rowPos++

      y++

      ' end for

      m.top.rowHeights = heights
      m.top.columnWidths = widths

      return data

end function


