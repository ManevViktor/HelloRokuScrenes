' sub init() 



' end sub


function FindDynamicStepSequenceFromIndex(arr as object, startIndex as integer) as object
      ' Define the step we're looking for
      stepJump = 3

      ' Ensure the startIndex is valid
      arrLength = arr.Count()
      if startIndex < 0 or startIndex >= arrLength
            print "Invalid starting index."
            return []
      end if
      ' Start the sequence from the given startIndex
      sequenceFound = []
      for i = startIndex to arrLength step + stepJump
            if(i < arrLength)
                  ' Add the next element to the sequence if it follows the step
                  sequenceFound.Push(arr[i])
            end if
      end for
      ' Return the found sequence
      return sequenceFound
end function