
function parseEmbetContent(data as object) as object

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
      for each market in json.betDetails
            j++

            ' "marketId": "sr:market:2",
            ' "presentation": "vertical",
            ' "marketName": "MONEYLINE",
            rowPos = 0
            for i = 0 to 2
                  cell = data.CreateChild("oddsBodyContent")

                  cell.X = rowPos
                  cell.Y = y
                  cell.W = 1
                  cell.H = 1


                  cell.marketData = createCellData(market, i)


                  cell.num = rowPos
                  if(i = 1) then
                        ?"cell bound rect"
                        wid = 220
                        cell.text = "market"
                  else
                        wid = 90
                        cell.text = "125"
                  end if
                  cell.width = wid
                  cell.height = 50


                  widths.push(cell.width)
                  heights.push(cell.height)

                  rowPos++
            end for
            y++

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
      present = getPresentationType(market)

      if(index = 0) then
            mdata = setMarketStats(market, index)

      else if(index = 1) then
            mdata = createmarketCell(market, index)
      else if(index = 2)
            mdata = setMarketStats(market, 1)
      end if
      mdata.present = present
      return mdata
end function


function setMarketStats(market as object, index as integer) as object
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


function createmarketCell(market as object, index as integer) as object

      r = {}
      if(market.presentation = "vertical") then
            r.text = ""
            r.description = market.marketName
      else
            r.text = ""
            
            r.description = market.marketName
      end if


      return r

end function



' 00 10 20
' 01 11 21
' 02    
' 03    25
' 04