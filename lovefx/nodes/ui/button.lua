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
    self.parentalControl = false
    self.expandWidth = args.expandWidth or false

    args.w = args.w or self.text:getWidth() + self.p*2
    args.h = args.h or self.text:getHeight() + self.p*2

    Button.super.new(self, args)
end

function Button:onLoad()

end

function Button:onUpdate()

    local x, y = love.mouse.getPosition()

    if self:containsPoint(x, y) then

        if self.mouseEntered then
            if love.mouse.isDown(1) then
                self:activateStyle('click')
                self:fireSignal('pressed')
            else
                self:activateStyle('hover')
            end
        else
            self.mouseEntered = true
            self:fireSignal('mouse-enter')
        end

    else

        self:activateStyle('default')

        if self.mouseEntered then
            self.mouseEntered = false
            self:fireSignal('mouse-exit')
            
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
    love.graphics.draw(self.text, self.w/2 - self.text:getWidth()/2 , y0 + self.p)

end

return Button