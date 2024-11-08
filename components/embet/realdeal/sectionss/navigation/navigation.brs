

function canFocusIndex(newIndex as integer) as boolean
      childCount = m.top.content.getChildCount() - 1
      if(newIndex > childCount) then
            return m.top.content.getChild(newIndex).canFocus
      else
            return false
      end if

end function

function navigationobject() as object

      this = {}
      this.focusedIndex = m.top.itemFocused
      this.childCount = m.top.content.getChildCount() - 1

      this.child = m.top.content.getChild(this.focusedIndex)
      this.type = this.child.nodeType

      return this

end function

function navigateDown() as dynamic
      obj = navigationobject()

      jump = 0
      found = invalid
      ' ?"count" obj.childCount
   
            j = 0
            i = m.top.itemFocused +1
            while(i <= obj.childCount)
                  j++
                  nextItem = getCh(i)
                  if(nextItem.canFocus = true and nextItem.placement = obj.child.placement and (nextItem.nodeType = m.nodeList.vertOdds or nextItem.nodeType = m.nodeList.horizOdds))
                        found = true
                        jump = j
                        exitwhile
                  else if (nextItem.canFocus = true and nextItem.nodeType = m.nodeList.vertOdds)
                        found = true    
                        jump = j
                        exitwhile
                  end if
                  i++

            end while
   
      ' ?"jump = " jump
      return jump

end function

function getCh(index as integer) as object
      return m.top.content.getChild(index)
end function

function navigateUp() as dynamic
      obj = navigationobject()
      i = obj.focusedIndex - 1
      jump = 0
      j = 0

      while(i >= 1)
            j++
            nextInline = m.top.content.getChild(i)
            if(nextInline.canFocus = true and nextInline.placement = obj.child.placement)
                  jump = j
                  exit while
            else
                  i--

            end if
      end while
      ' ?"navigate up = " jump
      return jump
end function

function navigateLeft() as dynamic
      obj = navigationobject()
      jump = invalid

      if(obj.type = "horizOdds" and obj.child.placement = "right")
            jump = 2
      end if

      return jump
end function


function navigateRight()

      obj = navigationobject()
      jump = invalid

      if(obj.type = "horizOdds" and obj.child.placement = "left")
            jump = 2
      end if

      return jump
end function

