sub init()

      ?"hello from layout group"


      node = m.top.findNode("childernOdds")

      obj2 = CreateObject("roSGNode", "ButtonExample")

      taskUI = CreateObject("roSGNode", "simpletaskscene")

      ' init2()
      ?"layoutgruop = "node

      node.appendChild(obj2)
      ' m.top.appendChild(obj2)
end sub


sub init2()
      ' Create a MaskedGroup node
      maskedGroup = CreateObject("roSGNode", "MaskGroup")
      maskedGroup.maskSize = [300, 300]
      maskedGroup.width = 400
      maskedGroup.height = 400
      maskedGroup.translation = [300, 200] ' Position in the scene
      maskedGroup.id = "maskedGroup"

      ' Create a rectangle node inside the MaskedGroup
      rectangle = CreateObject("roSGNode", "Rectangle")
      rectangle.width = 200
      rectangle.height = 100
      rectangle.color = "#FF0000" ' Red color
      rectangle.translation = [50, 50] ' Position inside the MaskedGroup
      rectangle.id = "rect" ' Assign an ID to the rectangle

      ' Append the rectangle to the MaskedGroup's children
      maskedGroup.appendChild(rectangle)

      ' Append the MaskedGroup to the scene's children
      m.top.appendChild(maskedGroup)

      ' Create an Animation node
      animation = CreateObject("roSGNode", "Animation")
      rectangle.appendChild(animation)

      ' Set the animation target to the rectangle node using its ID
      animation.target = "rect" ' Target is the ID of the rectangle node

      ' Set up the animation properties
      animation.duration = 2.0 ' Duration of the animation in seconds
      animation.repeat = "loop" ' Set to "none", "loop", or "once"


      interp = CreateObject("roSGNode", "Vector2DFieldInterpolator")
      animation.appendChild(interp)

      interp.key = [0.0, 1.0]
      interp.keyValue = [[1, 1], [3, 3]]
      interp.fieldToInterp = rectangle.id + ".scale"
      animation.AppendChild(interp)
      ' Define keyframe animation for height change

      ' Append the animation to the scene's children


      ' Start the animation
      animation.control = "start"
end sub