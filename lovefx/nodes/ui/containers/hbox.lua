local Node = require 'lovefx.nodes.node'
local HBox = Node:extend()

function HBox:new(options)

    options = options or {}

    HBox.super.new(self, options)

    self.expandWidth = options.expandWidth or 1
    self.expandHeight = options.expandHeight or 1

    self.minWidth = options.minWidth or 0
    self.minHeight = options.minHeight or 0

    self.spacing = options.spacing or 0

end

function HBox:onUpdate()

    -- set x pos
    if self.children ~= nil and self.dirty ~= Node.DIRTY_NONE then    

        local totalRatioWidth = 0

        for i = 1, #self.children do
            totalRatioWidth = totalRatioWidth + self.children[i].expandWidth
        end

        local ratioOne = self.w / totalRatioWidth
        local nextX = 0

        for i = 1, #self.children do

            -- find node
            local node = self.children[i]

            -- force anchor
            node:setAnchor(0, 0)

            -- set horizontal position
            node:setPosition(nextX, node.y)

            -- set child size
            node:setSize(math.max(ratioOne * node.expandWidth, node.minWidth), math.max(self.h * node.expandHeight, node.minHeight)) 

            -- set next x pos
            nextX = nextX + node.w

            -- no space after last child
            if i ~= #self.children then
                nextX = nextX + self.spacing
            end

        end

    end

end

return HBox