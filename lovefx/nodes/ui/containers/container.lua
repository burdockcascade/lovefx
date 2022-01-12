local Node = require 'lovefx.nodes.node'
local Container = Node:extend()

function Container:new(options)
    Container.super.new(self, options)
end

function Container:onDraw()

    local x0, y0 = self:getLeftTop()

    love.graphics.setColor(Color.Blue)
    love.graphics.setLineWidth(1)
    love.graphics.rectangle('fill', x0, y0, self.w, self.h)

    love.graphics.print(self.w .. ";" .. self.h)

end

return Container