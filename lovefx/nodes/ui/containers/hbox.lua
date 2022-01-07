local Container = require 'lovefx.nodes.ui.containers.container'
local HBox = Container:extend()

function HBox:new(options)
    HBox.super.new(self, options)
end

function HBox:onUpdate()

    local nextX = 0

    if self.children ~= nil then    
        for i = 1, #self.children do            
            local node = self.children[i]
            node:setPosition(nextX, node.y)
            nextX = nextX + node.w
        end
    end

end

return HBox