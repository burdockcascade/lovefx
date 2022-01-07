local Color = require('lovefx.util.color')
local Node = require('lovefx.nodes.node')
local Circle = Node:extend()

function Circle:new(options)
    self.mode = options.mode or 'line'
    self.radius = options.radius or 0
    options.w = options.radius * 2
    options.h = options.radius * 2
    Circle.super.new(self, options)
end

function Circle:onDraw()
    love.graphics.setColor(self.color)
    love.graphics.circle(self.mode, self.x, self.y, self.radius)
    love.graphics.setColor({255, 255, 255, 255})    
end

return Circle