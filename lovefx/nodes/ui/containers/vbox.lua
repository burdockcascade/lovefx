local Node = require 'lovefx.nodes.node'
local HBox = Node:extend()

function HBox:new(options)
    HBox.super.new(self, options)

    self.spacing = options.spacing or 0

end

function HBox:onChildAdded(node)
    node:setAnchor(0, 0)
end

function HBox:onUpdate()

    -- dont waste cpu
    if self.dirty == Node.DIRTY_NONE then
        return
    end    

    local nextY = 0

    if self.children ~= nil then    
        for i = 1, #self.children do

            -- find node
            local node = self.children[i]

            -- set horizontal position
            node:setPosition(node.x, nextY)

            -- set next x pos
            nextY = nextY + node.h + 1

            if i ~= #self.children then
                nextY = nextY + self.spacing
            end

            -- expand self
            self.w = math.max(self.w, node.w)

        end
    end    

    if self.children ~= nil then    
        for i = 1, #self.children do

            -- find node
            local node = self.children[i]

            if node.extendWidthHorizontal then
                node:setSize(self.w, node.h)
            end

        end
    end    

end

return HBox