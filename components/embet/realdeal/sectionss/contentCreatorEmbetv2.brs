function parseEmbetContentv2(jsondata as object, history as object) as object

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
      cell.marketData = { description: "GAME ODDS" }
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
                              cell.nodeType = nodesCollection.horizMarket
                        else
                              wid = (totalWidth / factor) - 2
                              cell.nodeType = nodesCollection.horizOdds
                              if(cell.marketData.isSuspended = true)
                                    cell.nodeType = nodesCollection.locked
                              end if

                              compareOutcomes(cell, history)
                        end if

                        cell.width = wid
                        cell.height = 50
                        widths.push(cell.width)
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
                              cell.height = 45
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
                              cell.height = 45
                              setstyle(cell)


                        end if

                  end for
            end if

      end for


      m.top.rowHeights = [50, 50, 50, 50, 45, 45, 45, 45]
      m.top.rowSpacings = [15, 15, 15, 15, 10, 10, 10, 10, 10]
      m.top.columnWidths = widths

      return data

end function


function getPresentationTypev2(market as object) as dynamic

      if market.presentation <> invalid then
            return market.presentation
      else
            return "horizontal"
      end if

end function

sub createDirectionv2(nodetype as object, index as dynamic) as object
      direction = {}
      nodesCollection = node_types()

      if(nodesCollection.horizOdds = nodetype) then 
          
      else 

      endif
end sub

function createCellDatav2(market as object, index as integer) as object

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


function createHOutcomeCellv2(market as object, index as integer) as object
      mdata = {}
      teamStats = market.marketoptions.getEntry(index)
      if(teamStats <> invalid) then
            mdata.marketID = market.marketID
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


function createHmarketCellv2(market as object, index as integer) as object
      r = {}
      r.description = market.marketName
      return r
end function

sub setstylev2(cell as object) as object
      cell.style = {
            headerFontSize: 16
            headerTextColor: "0xFFFFFF"
            headerfontType: "bold"
            headerFont: "font:smallestBoldSystemFont"

            primaryFontSize: 12
            primaryTextColor: "0xFFFFFF"
            primaryfontType: "medium"
            primaryFont: "font:SmallestSystemFont"

            secondaryFontSize: 11
            secondaryTextColor: "0xFFFFFF"
            secondaryFontType: "small"
            secondaryFont: "font:SmallestSystemFont"

            bgColor: "0x000000"

      }
end sub

sub compareOutcomesv2(newCell as object, history as object)

      newCell.stream = "same"

      if(newCell <> invalid and newCell.marketData <> invalid)
            historyMarket = findCurrentMarket(history, newCell)

            historyOdds = findHistoryOdds(historyMarket, newCell)


            if(historyOdds <> invalid)

                  ?"current market = " historyMarket
                  ?"history odds =" historyOdds

                  newCell.stream = compareOdds(historyOdds.odds, newCell.marketData.odds)
                  ?"compare odds = "newCell.stream
            end if

      end if

      ?"cell stream" newCell.stream
end sub

function findCurrentMarketv2(historyJson as object, newCell as object)

      this = invalid

      if(historyJson <> invalid and newCell <> invalid and newCell.marketData <> invalid)
            for each item in historyJson.betDetails
                  if(item.marketID = newCell.marketData.marketID)
                        this = item
                        exit for
                  end if
            end for
      end if

      return this
end function

function findHistoryOddsv2(historyMarket as object, newCell as object)

      this = invalid

      if(historyMarket <> invalid and newCell <> invalid and newCell.marketData <> invalid)
            for each item in historyMarket.marketOptions
                  if(item.outcomeId = newCell.marketData.outcomeId)
                        this = item
                        exit for
                  end if
            end for
      end if

      return this
end function

function compareOddsv2(historyodds, newCellOdss) as dynamic


      old = historyodds.toFloat()
      new = newCellOdss.toFloat()
      ?"history odd" old
      ?"new odd" new

      if(old > new)
            return "down"
      else if (old < new)
            return "up"
      else return "same"
      end if

end function





' 00 10 20
' 01 11 21
' 02
' 03    25
' 04 14 24




