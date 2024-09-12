sub init()

?"hello from layout group"


node = m.top.findNode("childernOdds")

obj2 = CreateObject("roSGNode", "ButtonExample")

taskUI = CreateObject("roSGNode", "simpletaskscene")


?"layoutgruop = "node

 node.appendChild(obj2)
' m.top.appendChild(obj2)
end sub