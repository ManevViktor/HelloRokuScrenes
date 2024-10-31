function node_types() as object

      this = {
            horizOdds: "horizOdds"
            horizMarket: "horizMarket",
            vertMarket: "vertMarket",
            vertOdds: "vertOdds",
            vertDesciption: "vertDescription",
            locked: "lockedOdds"
      }

      return this

end function

sub createHorizotalOddsHome(cell as object)

end sub

sub createHorizotalOddsAway(cell as object)

end sub

sub createHorizotalOddMarket(cell as object)

end sub

sub createVerticalOddMarket(cell as object)

end sub

sub createVerticalOddDescription(cell as object)

end sub

sub createVerticalOddHome(cell as object)

end sub

sub createVerticalOddsCell(cell as object, y as integer, totalWidth as float, factor as float)
      ' cell.X = 2
      ' cell.Y = y
      ' cell.W = 1
      ' cell.H = 1
      ' cell.width = (totalWidth / factor) - 2
      ' cell.nodeType = nodesCollection.vertOdds
      ' cell.text = market.marketoptions[kl / 2].odds
      ' cell.num = StrToI(market.marketoptions[kl / 2].description)
      ' cell.height = 45
      ' setstyle(cell)
      ' cell.canFocus = true
      ' cell.placement = "right"
      ' compareOutcomes(cell, history)
end sub


function createVerticalMarketData(market as object, index as integer) as object
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

sub createVerticalOddAway(cell as object)

end sub