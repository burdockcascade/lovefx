local Node = require 'lovefx.nodes.node'
local Panel = Node:extend()

function Panel:new(params)

    params = params or {}

    Panel.super.new(self, params)
    self.color = params.color or Color("white")
    self.mode = params.mode or 'line'
    self.rx = params.rx or 0
    self.ry = params.ry or 0
    self.segments = params.segments or 0

    self.expandWidth = params.expandWidth or 1
    self.expandHeight = params.expandHeight or 1

    self.minWidth = params.minWidth or 0
    self.minHeight = params.minHeight or 0

end

function Panel:onDraw()

    local x0, y0 = self:getLeftTop()

    -- box
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", x0, y0, self.w, self.h, self.rx, self.ry, self.segments)

    -- border
    -- love.graphics.setColor(self.color)
    -- love.graphics.rectangle("fill", self.x + 1, self.y + 1, self.w - 2, self.h - 2, self.rx, self.ry, self.segments)
    
end

return Panel