local Node = require 'lovefx.nodes.node'
local Canvas = Node:extend()

function Canvas:new()
    Canvas.super.new(self)

    -- canvas anchors cant be set
    self.anchorX = 0
    self.anchorY = 0

end

function Canvas:onUpdate(dt)

    self.w = love.graphics.getWidth()
    self.h = love.graphics.getHeight()

    -- -- set x pps for each child
    -- if self.children ~= nil then    
    --     for i = 1, #self.children do

    --         -- find node
    --         local node = self.children[i]

    --         -- set horizontal position
    --         node:setPosition(nextX, node.y)

    --         -- set next x pos
    --         nextX = nextX + node.w + 1

    --         if i ~= #self.children then
    --             nextX = nextX + self.spacing
    --         end

    --         -- expand self
    --         self.w = math.max(self.x, node.x)

    --     end
    -- end    

end

return Canvas