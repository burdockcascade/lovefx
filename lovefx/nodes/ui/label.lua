local Node = require 'lovefx.nodes.node'
local Label = Node:extend()

function Label:new(options)
    self.textString = options.text
    self.color = options.color or Color("White")
    self.font = options.font or love.graphics.newFont(16)
    self.text = love.graphics.newText(self.font, self.textString)

    options.w = self.text:getWidth()
    options.h = self.text:getHeight()

    Label.super.new(self, options)
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
end

function Label:onDraw()
    local color = self.color
    love.graphics.setColor(self.color)
    love.graphics.draw(self.text, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy)
end

return Label