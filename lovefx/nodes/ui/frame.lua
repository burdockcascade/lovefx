local Color = require 'lovefx.util.color'
local Node = require 'lovefx.nodes.node'
local Frame = Node:extend()

function Frame:new(params)
    Frame.super.new(self, params)
    self.color = params.color or Color.white
    self.mode = params.mode or 'line'
    self.rx = params.rx or 0
    self.ry = params.ry or 0
    self.segments = params.segments or 0
end

function Frame:onDraw()
    love.graphics.setColor(Color.Silver)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h, self.rx, self.ry, self.segments)

    love.graphics.setColor(Color.White)
    love.graphics.rectangle("fill", self.x + 1, self.y + 1, self.w - 2, self.h - 2, self.rx, self.ry, self.segments)
end

return Frame