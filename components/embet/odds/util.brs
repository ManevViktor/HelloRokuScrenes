
sub logEvent(item as object)
      m.debug = m.global.embetSDK.debug
      if m.debug = true  then
            ?"log embet event: "chr(10)  item.key " val =  " item.value
      end if
end sub