local Color = require 'lovefx.util.color'
local Node = require 'lovefx.node'
local Label = Node:extend()

function Label:new(params)
    self.textString = params.text
    self.color = params.color or Color.white
    self.font = (type(params.font) == 'number' and love.graphics.newFont(params.font)) or params.font
    self.text = love.graphics.newText(self.font, self.textString)

    params.width = self.text:getWidth()
    params.height = self.text:getHeight()

    Label.super.new(self, params)
end

function Label:getString()
    return self.textString
end

function Label:setText(textString, wrapLimit, alignMode)
    self.textString = textString
    if wrapLimit ~= nil and alignMode ~= nil then
        self.text:setf(textString, wrapLimit, alignMode)
    else
        self.text:set(textString)
    end
    self:updateSize(self.text:getDimensions())
end

function Label:onDraw()
    local color = self.color
    local x0, y0 = self:getLeftTop()
    love.graphics.setColor(color[1], color[2], color[3], color[4])
    love.graphics.draw(self.text, x0, y0)
end

return Label