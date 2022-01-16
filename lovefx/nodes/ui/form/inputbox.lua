local Node = require 'lovefx.nodes.node'
local InputBox = Node:extend()

function InputBox:new(params)

    params = params or {}

    InputBox.super.new(self, params)
    self.color = params.color or Color("white")
    self.mode = params.mode or 'line'
    self.rx = params.rx or 0
    self.ry = params.ry or 0
    self.segments = params.segments or 0

    self.font = params.font or love.graphics.newFont(16)
    
    self.text = ""

    self.expandWidth = params.expandWidth or 0
    self.expandHeight = params.expandHeight or 0

end

function InputBox:onInput(evt)

    if keycode == 'backspace' then
        self.text = ""
    elseif evt.name == 'textinput' then
        self.text = self.text .. evt.text
    end

end

function InputBox:onDraw()

    -- box
    love.graphics.setColor(Color("Silver"))
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h, self.rx, self.ry, self.segments)

    -- border
    love.graphics.setColor(Color("White"))
    love.graphics.rectangle("fill", self.x + 1, self.y + 1, self.w - 2, self.h - 2, self.rx, self.ry, self.segments)

    love.graphics.setColor(Color("black"))
    love.graphics.print(self.text)
    
end

return InputBox