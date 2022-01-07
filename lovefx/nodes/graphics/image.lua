local Node = require('lovefx.nodes.node')
local Image = Node:extend()

function Image:new(options)

    if options.src == nil then
        error("image needs a source")
    end

    options = options or {}
    options.w = options.w or options.src:getWidth()
    options.h = options.h or options.src:getHeight()

    self.src = options.src

    Image.super.new(self, options)
    
end

function Image:onDraw()
    local x0, y0 = self:getLeftTop()
    love.graphics.draw(self.src, x0, y0)
end

function Image:setSource(src, settings)
    self.src = src
end

return Image