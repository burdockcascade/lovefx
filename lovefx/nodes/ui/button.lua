local Color = require 'lovefx.util.color'
local Node = require 'lovefx.nodes.node'
local Button = Node:extend()

function Button:new(options)


    options.x = 0
    options.y = 0

    self.color = Color.white
    self.textString = options.text
    self.font = options.font or love.graphics.newFont(16)
    self.text = love.graphics.newText(self.font, self.textString)
    self.mode = 'line'
    self.lineWidth = 1

    self.p = 10

    options.w = options.w or self.text:getWidth() + self.p*2
    options.h = options.h or self.text:getHeight() + self.p*2

    Button.super.new(self, options)
end

function Button:onUpdate()

    local expandX = true

    if expandX then
        self:setSize(self.parent.w, self.h)
    end

    local x, y = love.mouse.getPosition()

    if self:checkMousePressed(x, y) then
        self.visible = false
    else
        self.visible = true
    end

end

function Button:onDraw()

    local color = self.color

    local x0, y0 = self:getLeftTop()

    -- text
    love.graphics.setColor(self.color)
    love.graphics.draw(self.text, x0 + self.p, y0 + self.p)

    -- border
    love.graphics.setColor(self.color)
    love.graphics.setLineWidth(self.lineWidth)
    love.graphics.rectangle(self.mode, x0, y0, self.w, self.h)
end

return Button