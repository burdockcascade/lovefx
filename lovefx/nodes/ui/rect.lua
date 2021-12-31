local Color = require 'lovefx.util.color'
local Node = require 'lovefx.node'
local Rect = Node:extend()

function Rect:new(params)
    Rect.super.new(self, params)
    self.color = params.color or Color.white
    self.mode = params.mode or 'line'
    self.rx = params.rx or 0
    self.ry = params.ry or 0
    self.segments = params.segments or 0
end

function Rect:onDraw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle(self.mode, self.x, self.y, self.w, self.h, self.rx, self.ry, self.segments)
end

return Rect