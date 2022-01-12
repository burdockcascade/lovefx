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

    local nextX = 0

    if self.children ~= nil then    
        for i = 1, #self.children do

            -- find node
            local node = self.children[i]

            -- set horizontal position
            node:setPosition(nextX, node.y)

            -- set next x pos
            nextX = nextX + node.w + 1

            if i ~= #self.children then
                nextX = nextX + self.spacing
            end

            -- expand self
            self.w = math.max(self.x, node.x)

        end
    end

end

return HBox