local Color = require 'lovefx.util.color'
local Node = require 'lovefx.node'
local Button = Node:extend()

function Button:new(params)

    self.color = Color.white
    self.textString = params.text
    self.font = params.font or love.graphics.newFont(16)
    self.text = love.graphics.newText(self.font, self.textString)
    self.mode = 'line'
    self.lineWidth = 1

    params.w = self.text:getWidth()
    params.h = self.text:getHeight()

    Button.super.new(self, params)
end

function Button:onUpdate()



end

function Button:onDraw()
    local color = self.color
    local x0, y0 = self:getLeftTop()

    love.graphics.setColor(color[1], color[2], color[3], color[4])
    love.graphics.draw(self.text, x0, y0, self.r)

    love.graphics.setColor(color[1], color[2], color[3], color[4])
    love.graphics.setLineWidth(self.lineWidth)
    love.graphics.rectangle(self.mode, x0, y0, self.w, self.h)
end

return Button