
function parseEmbetContent(data as object) as object

      json = m.embetData

      m.x = 0
      m.y = 0

      y = 0
      x = 0
      ?"jsopn" json

      widths =[]
      heights =[]

      data = CreateObject("roSGNode", "ContentNode")

      for each market in json.betDetails


            ' "marketId": "sr:market:2",
            ' "presentation": "vertical",
            ' "marketName": "MONEYLINE",

            for i = 0 to 2
                  cell = data.CreateChild("oddsBodyContent")
                  x = i
                  cell.X = i
                  cell.Y = y
                  cell.W = 1
                  cell.H = 1

                  cell.num = x
                  if(i = 1) then
                        ?"cell bound rect" m.top.boundingRect()
                        wid = 180
                        cell.text = "market"
                  else
                        wid = 70
                        cell.text = "125"
                  end if
                  cell.width = wid
                  cell.height = 50

                  widths.push(cell.width)
                  heights.push(cell.height)

            end for
            y++

      end for


      m.top.rowHeights = heights
      m.top.columnWidths = widths

      return data

end function