
function parseEmbetContent(jsondata as object, history as object) as object

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


            colPos = 0
            present = getPresentationType(market)


            ' horizontal presentation
            if(present = "horizontal") then
                  for i = 0 to 2
                        cell = data.CreateChild("oddsBodyContent")
                        cell.X = colPos
                        cell.Y = y
                        cell.W = 1
                        cell.H = 1
                        cell.num = colPos

                        cell.marketData = createCellData(market, i)

                        setstyle(cell)

                        if(i = 1) then
                              ?"cell bound rect"
                              wid = totalWidth - (totalWidth / factor * 2)
                              cell.nodeType = nodesCollection.horizMarket
                              cell.canFocus = false
                        else

                              if(i = 0)
                                    cell.placement = "left"
                              else 
                                    cell.placement = "right"
                              endif

                              wid = (totalWidth / factor) - 2
                              cell.nodeType = nodesCollection.horizOdds
                              cell.canFocus = true
                              compareOutcomes(cell, history)
                              
                              ' if(cell.marketData.isSuspended = true)
                              '       cell.nodeType = nodesCollection.locked
                              ' end if

                        end if

                        cell.width = wid
                        cell.height = 50
                        widths.push(cell.width)
                        colPos++
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
                              cell.canFocus = true
                              cell.placement = "right"
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


function getPresentationType(market as object) as dynamic

      if market.presentation <> invalid then
            return market.presentation
      else
            return "horizontal"
      end if

end function

sub createDirection(nodetype as object, index as dynamic) as object
      direction = {}
      nodesCollection = node_types()

      if(nodesCollection.horizOdds = nodetype) then 
          
      else 

      endif
end sub

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


function createHmarketCell(market as object, index as integer) as object
      r = {}
      r.description = market.marketName
      return r
end function

sub setstyle(cell as object) as object
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

sub compareOutcomes(newCell as object, history as object)

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

function findCurrentMarket(historyJson as object, newCell as object)

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

function findHistoryOdds(historyMarket as object, newCell as object)

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

function compareOdds(historyodds, newCellOdss) as dynamic


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




