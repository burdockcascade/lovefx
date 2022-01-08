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

function Camera:translatePosition(x, y)
    self.root:translatePosition(x, y)
end

function Camera:setScale(x, y)
    self.root:setScale(x, y)
end

function Camera:translateScale(x, y)
    self.root:translateScale(x, y)
end

function Camera:setRotation(r)
    self.root:setRotation(r)
end

function Camera:translateRotation(r)
    self.root:translateRotation(r)
end

return Camera