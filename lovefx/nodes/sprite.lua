local Node = require 'lovefx.node'
local Sprite = Node:extend()

function Sprite:new(params)

    self:setSource(params.src, params.settings or {})

    params.w = params.src:getWidth()
    params.h = params.src:getHeight()

    Sprite.super.new(self, params)
end

function Sprite:onDraw()
    love.graphics.draw(self.image, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy)
end

function Sprite:setSource(src, settings)
    self.image = src
end

return Sprite