local Path = string.sub(..., 1, -string.len(".objects.frame"))
local Class = require(Path..".third-party.middleclass")
local OBase = require(Path..".api.objectbase")
local HBase = require(Path..".api.handlerbase")
local Material = require(Path..".third-party.material-love")

local OFrame = Class("object.frame",OBase)

local Config = {}
Config.BarHeight = 30
Config.BarTextYOffset = 3

function OFrame:initialize(x,y,w,h,t)
  OBase.initialize(self)
  local PMug = require(Path)
  self.SBody = PMug.Shape.rectangle(0,0,w,h)
  self.SetToTopAction = PMug.Action.updateState(true,true,false)
  self.UpdateStateAction = PMug.Action.updateState()
  self.DragAction = PMug.Action.dragObject()
  self.CloseAction = PMug.Action.onClick(function() self:destroy() end)
  self.SBar = PMug.Shape.rectangle(0,0,w,Config.BarHeight):setDrawingArgs(true,true,false,{Material.colors.main("teal")},false)
  self.SIcon = PMug.Shape.icon("blinds",Config.BarHeight/2,Config.BarHeight/2,0,"black",false)
  self.SText = PMug.Shape.textrect(t,Config.BarHeight,Config.BarTextYOffset,w-Config.BarHeight*2,Config.BarHeight,"left"):setDrawingArgs("title",{Material.colors("teal","900")})
  self.SCloseBox = PMug.Shape.rectangle(w-Config.BarHeight,0,Config.BarHeight,Config.BarHeight):setDrawingArgs(true,true,{Material.colors("teal","300")},{Material.colors.main("teal")},{Material.colors("teal","400")})
  self.SCloseIcon = PMug.Shape.icon("close",w-Config.BarHeight/2,Config.BarHeight/2,0,"black",false)
  self.HClose = HBase():linkShape(self.SCloseBox):linkShape(self.SCloseIcon):addAction(self.UpdateStateAction):addAction(self.CloseAction)
  self.DMaterial = PMug.Drawer.material() self.HBar = HBase():linkShape(self.SBar):addAction(self.DragAction):addAction(self.SetToTopAction)
  self.DMaterial:linkShape(self.SBody):linkShape(self.SBar):linkShape(self.SIcon):linkShape(self.SText):linkShape(self.SCloseBox):linkShape(self.SCloseIcon)
  self.HBody = HBase():linkShape(self.SBody):addAction(self.SetToTopAction)
  self:addDrawer(self.DMaterial):addHandler(self.HClose):addHandler(self.HBar):addHandler(self.HBody)
  
  self:setPosition(x,y)
end

return OFrame