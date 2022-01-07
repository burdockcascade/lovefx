local Color = require('lovefx.util.color')
local Node = require('lovefx.nodes.node')
local Rectangle = Node:extend()

function Rectangle:new(options)
    self.mode = options.mode or 'line'
    self.rx = options.rx or 0
    self.ry = options.ry or 0
    self.segments = options.segments or 0

    Rectangle.super.new(self, options)
end

function Rectangle:onDraw()
    love.graphics.setColor(self.color)
    local x0, y0 = self:getLeftTop()
    love.graphics.rectangle(self.mode, x0, y0, self.w, self.h, self.rx, self.ry, self.segments)
    love.graphics.setColor({255, 255, 255, 255})
end

return Rectangle