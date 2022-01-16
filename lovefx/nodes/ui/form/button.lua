local Node = require 'lovefx.nodes.node'
local Button = Node:extend()

function Button:new(args)

    self.style = {

        default = {
            backgroundColor = Color("White"),
            borderColor = Color("Blue"),
            textColor = Color("Blue"),
            cornerRadians = 4,
            padding = 6
        },
        hover = {
            backgroundColor = Color("Blue"),
            textColor = Color("White"),
        },
        click = {
            backgroundColor = Color("Blue"),
            textColor = Color("Black"),
        }

    }

    -- style
    self.p = self.style.default.padding
    self.corners = self.style.default.cornerRadians
    self.font = args.font or love.graphics.newFont(16)
    self.borderWidth = 1

    self:activateStyle('default')

    -- base
    self.textString = args.text
    self.text = love.graphics.newText(self.font, self.textString)
    self.tip = args.tip or ""

    -- flags
    self.expandWidth = args.expandWidth or 0
    self.expandHeight = args.expandHeight or 0

    self.minWidth = args.minWidth or self.text:getWidth() + self.p*2
    self.minHeight = args.minHeight or self.text:getHeight() + self.p*2

    self.textHeight = self.text:getHeight()
    self.textWidth = self.text:getWidth()

    Button.super.new(self, args)
end

function Button:onInput(evt)

    if evt.name == "mouse-pressed" and self:containsPoint(love.mouse.getPosition()) then
        self:activateStyle('click')   
    end
    
    if evt.name == "mouse-released" and self:containsPoint(love.mouse.getPosition())  then
        self:fireSignal('pressed')
        self:activateStyle('hover')  
    end

end

function Button:onUpdate()

    if self:containsPoint(love.mouse.getPosition()) then
        if not self.mouseEntered then
            self:fireSignal('mouse-enter')
            self:activateStyle('hover')    
            self.mouseEntered = true
        end
    else
        if self.mouseEntered then
            self:fireSignal('mouse-exit')
            self:activateStyle('default')    
            self.mouseEntered = false
        end
    end

end

function Button:activateStyle(style)

    self.textColor = self.style[style].textColor or self.style.default.textColor
    self.buttonBackground = self.style[style].backgroundColor or self.style.default.backgroundColor
    self.borderColor = self.style[style].borderColor or self.style.default.borderColor
    self.corners = self.style[style].cornerRadians or self.style.default.cornerRadians

end

function Button:onDraw()

    local x0, y0 = self:getLeftTop()

   -- draw inside box
   love.graphics.setColor(self.buttonBackground)
   love.graphics.rectangle('fill', x0, y0, self.w, self.h, self.corners)

    -- draw outside box
    love.graphics.setColor(self.borderColor)
    love.graphics.setLineWidth(self.borderWidth)    
    love.graphics.rectangle('line', x0, y0, self.w, self.h, self.corners)

    -- text
    love.graphics.setColor(self.textColor)
    love.graphics.draw(self.text, x0 + (self.w - self.textWidth)/2, y0 + (self.h - self.textHeight)/2)

end

return Button