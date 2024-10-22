

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

      if(obj.child = invalid) then
            return invalid
      else if(obj.type = node_types().horizOdds and obj.child.placement = "home")
            return invalid
      else if(obj.type = m.nodeList.vertOdds)
            return 2
      else return 3
      end if

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
      ?"navigate up = " jump
      return jump
end function

function navigateLeft()

end function


function navigateRight()
end function

