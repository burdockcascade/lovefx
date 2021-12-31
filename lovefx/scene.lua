local Node = require 'lovefx.node'
local Scene = Node:extend()

function Scene:new(designWidth, designHeight)

    local screenWidth, screenHeight = love.graphics.getWidth(), love.graphics.getHeight()
    local sw, sh = screenWidth / designWidth, screenHeight / designHeight
    local scale = math.floor(math.min(sw, sh))
    
    local scaledWidth, scaledHeight = designWidth * scale, designHeight * scale
    local dx, dy = screenWidth - scaledWidth, screenHeight - scaledHeight
    
    local x, y = screenWidth * 0.5, screenHeight * 0.5
    local w, h = designWidth + dx / scale, designHeight + dy / scale
    
    Scene.super.new(self, {x = x, y = y, w = w, h = h})

    -- self:updateScale(scale, scale)

end

return Scene