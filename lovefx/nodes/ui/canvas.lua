local Node = require 'lovefx.nodes.node'
local Canvas = Node:extend()

function Canvas:new()
    Canvas.super.new(self)

    -- canvas anchors cant be set
    self.anchorX = 0
    self.anchorY = 0

end

function Canvas:onUpdate(dt)

    -- dont waste cpu
    if self.w == love.graphics.getWidth() and self.h == love.graphics.getHeight() then
        return
    end

    -- set size based on window size
    self.w = love.graphics.getWidth()
    self.h = love.graphics.getHeight()

    -- set each child
    if self.children ~= nil then    
        for i = 1, #self.children do

            -- find node
            local node = self.children[i]

            -- force anchor
            node:setAnchor(0, 0)

            -- expand node
            node:setSize(self.w * node.expandWidth, self.h * node.expandHeight)

        end
    end  

end

return Canvas