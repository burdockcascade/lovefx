local Node = require 'lovefx.nodes.node'
local Camera = Node:extend()

function Camera:new(options)
    Camera.super.new(self, options)
end

function Camera:onUpdate()

    self.x = self.parent.x
    self.y = self.parent.y

end

function Camera:setPosition(x, y)
    self.parent:setPosition(x, y)
end

function Camera:translatePosition(x, y)
    self.parent:translatePosition(x, y)
end

function Camera:setScale(x, y)
    self.parent:setScale(x, y)
end

function Camera:translateScale(x, y)
    self.parent:translateScale(x, y)
end

function Camera:setRotation(r)
    self.parent:setRotation(r)
end

function Camera:translateRotation(r)
    self.parent:translateRotation(r)
end

return Camera