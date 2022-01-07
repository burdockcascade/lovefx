local Node = require('lovefx.nodes.node')
local CanvasLayer = Node:extend()

function CanvasLayer:new(options)
    Group.super.new(self, options)
end

return CanvasLayer