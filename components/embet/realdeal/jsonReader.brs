sub init()
      m.top.functionName = "getcontent"
end sub

sub getcontent()

      ' filename = m.top.marketID
      filename = "pkg:/components/file/market.json"

      ?"filename ="filename
      json = data()


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

sub data() as dynamic

      this =     {
                 
                  betDetails: [
                    {
                      marketId: "sr:market:1",
                      marketName: "SPREAD",
                     presentation: "horizontal",
                     marketOptions: [
                        {
                          "description": "O 3.5",
                          "odds": "-150",
                          "imageUrl": "",
                          "url": "https://odds_composit_url",
                          "outcomeId": "sr:outcome:1",
                          "isSuspended": false
                        },
                        {
                          "description": " 100",
                          "odds": "+200",
                          "imageUrl": "",
                          "url": "https://odds_composit_url",
                          "outcomeId": "sr:outcome:2",
                          "isSuspended": false
                        }
                      ]
                    },
                    {
                      "marketId": "sr:market:2",
                     presentation: "horizontal",
                      "marketName": "MONEYLINE",
                     marketOptions: [
                        {
                          "description": "O 3.5",
                          "odds": "-200",
                          "imageUrl": "",
                          "url": "https://odds_composit_url",
                          "outcomeId": "sr:outcome:3",
                          "isSuspended": false
                        },
                        {
                          "description": "U 3.5",
                          "odds": "+200",
                          "imageUrl": "",
                          "url": "https://odds_composit_url",
                          "outcomeId": "sr:outcome:4",
                          "isSuspended": false
                        }
                      ]
                    },
                    {
                      "marketId": "sr:market:3",
                     presentation: "vertical",
                      "marketName": "TOTAL",
                     marketOptions: [
                        {
                          "description": "O 3.5",
                          "odds": "-200",
                          "imageUrl": "",
                          "outcomeId": "sr:outcome:12",
                          "isSuspended": false,
                          "url": "https://odds_composit_url"
                        },
                        {
                          "description": "U 3.5",
                          "odds": "+200",
                          "imageUrl": "",
                          "outcomeId": "sr:outcome:13",
                          "isSuspended": false,
                          "url": "https://odds_composit_url"
                        }
                      ]
                    }
                  ]
                }
         
          
      return this

end sub




' 1 4 7 10
' 2 5 8 11
' 3 6 9 12

