local Path = string.sub(..., 1, string.len(...) - string.len(".api.shapebase"))
local Class = require(Path..".third-party.middleclass")

local SBase = Class("shape.base") SBase.PMUGS = true --P-Mug Shape Class

function SBase:initialize()
  
end

function SBase:setProperties()
  
end

function SBase:getProperties()
  return nil
end

function SBase:getDrawingArgs()
  return nil
end

--Return the shape type.
function SBase:getType()
  return "base"
end

--Return the drawtype of the shape. Refer to the drawer you are using.
function SBase:getDType()
  return "none"
end

--Can be used for making affects.
function SBase:update(dt)
  
end

--Returns the points of the bounding box for the transformed shape.
function SBase:computeAABB()
  return 0,0,0,0
end

--Checks whether a point lies inside the shape.
function SBase:testShape(x,y)
  return false
end

return SBase