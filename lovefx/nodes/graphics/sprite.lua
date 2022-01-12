local Node = require('lovefx.nodes.node')
local Sprite = Node:extend()

function Sprite:new(args)

    if args.spritesheet == nil then
        error("Sprite needs a Spritesheet")
    end

    local cellX = args.cellX or 0
    local cellY = args.cellY or 0

    self.image = args.spritesheet.image
    self.quad = args.spritesheet:getQuad(cellX, cellY)

    Sprite.super.new(self, args)
    
end

function Sprite:onDraw()
    local x0, y0 = self:getLeftTop()
    
    love.graphics.draw(self.image, self.quad, x0, y0)
end

function Sprite:setCell(x, y)
    self.quad = args.spritesheet:getQuad(x, y)
end

return Sprite