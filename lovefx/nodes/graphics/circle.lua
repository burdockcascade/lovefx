local Color = require('lovefx.util.color')
local Node = require('lovefx.node')
local Circle = Node:extend()

function Circle:new(options)
    self.mode = options.mode or 'line'
    self.radius = options.radius or 0
    Circle.super.new(self, options)
end

function Circle:onDraw()
    love.graphics.setColor(self.color)
    local x0, y0 = self:getLeftTop()
    love.graphics.circle(self.mode, x0, y0, self.radius)
    love.graphics.setColor({255, 255, 255, 255})
end

return Circle