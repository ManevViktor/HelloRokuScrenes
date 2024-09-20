sub init()
      m.top.functionName = "getcontent"
end sub

sub getcontent()
      json = ParseJson(ReadAsciifile("pkg:/components/file/market.json"))
    

      newdata = []

      for each item in json.betDetails
            newdata.push( {
                homeodds:  item.marketOptions[0]
                marketName:   item
                awayodds : item.marketOptions[1]        
            })
      endfor

      ?"new data = "newdata
end sub

function getMarket(market as dynamic) as object

end function      




' 1 4 7 10
' 2 5 8 11
' 3 6 9 12

