local Node = require('lovefx.nodes.node')
local Group = Node:extend()

function Group:new(options)
    Group.super.new(self, options)
end

-- function Group:onDraw()
--     local x1, y1, x2, y2 = self:getBox()
--     love.graphics.rectangle('line', x1, y1, x1 - x2, y1 - y2)
-- end

return Group