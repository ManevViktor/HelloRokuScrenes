sub init()
      m.top.functionName = "getcontent"
end sub

sub getcontent()

      filename = m.top.marketID

      ?"filename ="filename
      json = ParseJson(ReadAsciifile(filename))


      ' newdata = []
      ' count = 0

      ' for each item in json.betDetails

      '       count ++
      '       newdata.push({
      '             homeodds: item.marketOptions[0]
      '             marketName: item
      '             awayodds: item.marketOptions[1]
      '       })

      ' end for





      m.top.dataContent = json
end sub




' 1 4 7 10
' 2 5 8 11
' 3 6 9 12

