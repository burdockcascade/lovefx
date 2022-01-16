local Node = require 'lovefx.nodes.node'
local Container = Node:extend()

function Container:new(options)
    Container.super.new(self, options)
end

return Container