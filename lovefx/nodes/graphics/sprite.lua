local Node = require('lovefx.node')
local Sprite = Node:extend()

function Sprite:new(options)

    self:setSource(options.src, options.settings or {})

    options.w = options.src:getWidth()
    options.h = options.src:getHeight()

    Sprite.super.new(self, options)
    
end

function Sprite:onDraw()
    local x0, y0 = self:getLeftTop()
    love.graphics.draw(self.image, x0, y0)
end

function Sprite:setSource(src, settings)
    self.image = src
end

return Sprite