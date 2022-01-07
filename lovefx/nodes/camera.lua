local Node = require 'lovefx.nodes.node'
local Camera = Node:extend()

function Camera:new(options)
    Camera.super.new(self, options)
end

function Camera:onUpdate()

    self.x = self.root.x
    self.y = self.root.y

end

function Camera:setPosition(x, y)
    self.root:setPosition(x, y)
end

return Camera