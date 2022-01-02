local Node = require 'lovefx.node'
local Camera = Node:extend()

function Camera:new(options)
    Camera.super.new(self, options)
end

function Camera:onDraw()

    -- love.graphics.setScissor(100, 100, 500, 500)    

end

return Camera