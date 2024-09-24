sub init()
      m.top.functionName = "getcontent"
end sub

sub getcontent()
      json = ParseJson(ReadAsciifile("pkg:/components/file/market.json"))


      newdata = []

      for each item in json.betDetails

            newdata.push({
                  homeodds: item.marketOptions[0]
                  marketName: item
                  awayodds: item.marketOptions[1]
            })

      end for

      rodata = []
      for each item2 in json.betDetails

            pr = getPresentationType(item2)

            rodata.push({
                  market: item2
                  odds: item2.marketOptions[0]
                  presentation : pr
                  type: "odds"
            })

            rodata.push({
                  market: item2
                  type: "market"
                  presentation : pr
                  odds : "none"
            })

            rodata.push({
                  market: item2
                  odds: item2.marketOptions[1]
                  presentation : pr
                  type: "odds"
            })

      end for

    

      m.top.dataContent = json
end sub


function getPresentationType(market as object) as dynamic
    
      if market.presentation <> invalid then
            return market.presentation 
      else
            return "horizontal"
      end if

end function

function getMarket(market as dynamic) as object

end function




' 1 4 7 10
' 2 5 8 11
' 3 6 9 12

