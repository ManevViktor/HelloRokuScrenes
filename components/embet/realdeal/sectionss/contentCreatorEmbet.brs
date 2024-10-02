
function parseEmbetContent(jsondata as object) as object

      json = jsondata

      m.x = 0
      m.y = 0

      y = 0
      x = 0

      size = m.global.embetSDK.widgetSize

      totalWidth = size[0]
      factor = 3.7
      ?"total width"

      widths = []
      heights = [50]
      rowSpaces = []

      nodesCollection = node_types()

      data = CreateObject("roSGNode", "ContentNode")

      cell = data.CreateChild("oddsBodyContent")
      cell.X = 0
      cell.Y = y
      cell.W = 3
      cell.H = 1
      cell.text = "GAME ODDS"
      cell.market = {description : "GAME ODDS"}
      cell.nodeType = nodesCollection.vertMarket
      setstyle(cell)


      y++
      j = 0
      for each market in json.betDetails
            j++

            if(j = 9) exit for


            rowPos = 0
            present = getPresentationType(market)


            ' horizontal presentation
            if(present = "horizontal") then
                  for i = 0 to 2
                        cell = data.CreateChild("oddsBodyContent")
                        cell.X = rowPos
                        cell.Y = y
                        cell.W = 1
                        cell.H = 1
                        cell.num = rowPos
                       
                        cell.marketData = createCellData(market, i)
                        setstyle(cell)
                        if(i = 1) then
                              ?"cell bound rect"
                              wid = totalWidth - (totalWidth / factor * 2)
                              cell.text = "market"
                              cell.nodeType = nodesCollection.horizMarket
                        else
                              wid = (totalWidth / factor) - 2
                              cell.text = "125"
                              cell.nodeType = nodesCollection.horizOdds
                        end if
                        cell.width = wid
                        cell.height = 50
                        widths.push(cell.width)

                        setstyle(cell)

                        rowPos++
                  end for
                  y++
                  heights.push(50)
            else
                  ' root of vertical markets
                  cell = data.CreateChild("oddsBodyContent")
                  cell.X = 0
                  cell.Y = y
                  cell.W = 3
                  cell.H = 1
                  cell.width = totalWidth
                  cell.height = 50
                  cell.text = market.marketName
                  cell.nodeType = nodesCollection.vertMarket
                  setstyle(cell)
                  y++


                  for kl = 0 to market.marketoptions.count() * 2 - 1

                        if(kl mod 2) = 1 then
                              cell = data.CreateChild("oddsBodyContent")
                              cell.X = 2
                              cell.Y = y
                              cell.W = 1
                              cell.H = 1
                              cell.width = (totalWidth / factor) - 2
                              cell.nodeType = nodesCollection.vertOdds
                              cell.text = market.marketoptions[kl / 2].odds
                              cell.num = StrToI(market.marketoptions[kl / 2].description)
                              cell.height = 50
                              setstyle(cell)
                              y++

                        else
                              cell = data.CreateChild("oddsBodyContent")
                              cell.X = 0
                              cell.Y = y
                              cell.W = 2
                              cell.H = 1
                              cell.width = totalWidth - ((totalWidth / factor) - 2)
                              cell.nodeType = nodesCollection.vertDesciption
                              if(kl = 0) then
                                    cell.text = market.marketoptions[kl / 2].description
                              else
                                    cell.text = market.marketoptions[kl / 2].description
                              end if
                              cell.num = 120
                              cell.height = 50
                              setstyle(cell)


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
            mdata.isSuspended = true
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

sub setstyle(cell as object) as object
      cell.style = {
            headerFontSize: 14
            headerTextColor: "0xFFFFFF"
            headerfontType  : "bold"
            headerFont : "font:smallestBoldSystemFont"
            
            primaryFontSize: 12
            primaryTextColor: "0xFFFFFF"
            primaryfontType  : "medium"
            primaryFont : "font:SmallestSystemFont"
            
            secondaryFontSize: 11
            secondaryTextColor: "0xFFFFFF"
            secondaryFontType : "small"
            secondaryFont : "font:SmallestSystemFont"
            
            bgColor: "0x000000"

      }
end sub





' 00 10 20
' 01 11 21
' 02
' 03    25
' 04 14 24




