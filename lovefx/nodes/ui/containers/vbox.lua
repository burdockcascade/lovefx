local Node = require 'lovefx.nodes.node'
local VBox = Node:extend()

function VBox:new(options)

    options = options or {}

    VBox.super.new(self, options)

    self.expandWidth = options.expandWidth or 1
    self.expandHeight = options.expandHeight or 1

    self.minWidth = options.minWidth or 0
    self.minHeight = options.minHeight or 0

    self.spacing = options.spacing or 0

end

function VBox:onUpdate()

    if self.children ~= nil and self.dirty ~= Node.DIRTY_NONE then    

        local totalRatioHeight = 0

        for i = 1, #self.children do
            totalRatioHeight = totalRatioHeight + self.children[i].expandHeight
        end

        local ratioOne = self.h / totalRatioHeight
        local nextY = 0
        
        for i = 1, #self.children do

            -- find node
            local node = self.children[i]

            -- force anchor
            node:setAnchor(0, 0)

            -- set horizontal position
            node:setPosition(node.x, nextY)

            -- set child size
            node:setSize(math.max(self.w * node.expandWidth, node.minWidth), math.max(ratioOne * node.expandHeight, node.minHeight))

            -- set next y pos
            nextY = nextY + node.h

            -- no space after last child
            if i ~= #self.children then
                nextY = nextY + self.spacing
            end

        end

    end       

end

return VBox