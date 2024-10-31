
sub logEvent(item as object)
      m.debug = m.global.embetSDK.debug
      if m.debug = true then
            ?"log embet event: "chr(10) item.key " val =  " item.value
      end if
end sub


sub appendGlobalEmbet(key as string ,value as object)
      get = m.global.getField("embetsdk")

      if(get <> invalid) then
            get.embetSDK = value
            m.global.setField("embetsdk", get)
      else
            m.global.addFields({ embetSDK: value })
      end if

end sub