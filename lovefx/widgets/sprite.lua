local Node = require 'lovefx.node'
local Sprite = Node:extend()

function Sprite:new(params)

    params.settings = params.settings or {}
    self.image = love.graphics.newImage(params.src, settings)

    Sprite.super.new(self, params)

end

function Sprite:onDraw()

    local x, y = self:getLeftTop()
    love.graphics.draw(self.image, x, y)

end

return Sprite