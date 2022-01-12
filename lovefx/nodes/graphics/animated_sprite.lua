local Node = require('lovefx.nodes.node')
local AnimatedSprite = Node:extend()

function AnimatedSprite:new(args)

    if args.spritesheet == nil then
        error("AnimatedSprite needs a Spritesheet")
    end

    local cellX = args.cellX or 0
    local cellY = args.cellY or 0

    self.animations = {}

    self.spritesheet = args.spritesheet
    self.fps = args.fps or 6
    self.image = args.spritesheet.image
    self.quad = args.spritesheet:getQuad(cellX, cellY)

    self.curentFrame = 1
    self.timePassed = 1000

    AnimatedSprite.super.new(self, args)
    
end

function AnimatedSprite:addAnimation(name, fps, cells)

    local quads = {}

    if cells ~= nill then
        for i = 1, #cells do
            table.insert(quads, self.spritesheet:getQuad(cells[i].x, cells[i].y))
        end
    end

    self.animations[name] = {
        delta = 1 / fps,
        quads = quads
    }    

end

function AnimatedSprite:playAnimation(name)
    if self.animations[name] ~= nil then
        self.currentAnimation = self.animations[name]
    end
end

function AnimatedSprite:onUpdate(dt)

    if self.timePassed > self.currentAnimation.delta  then
        self.quad = self.currentAnimation.quads[self.curentFrame]
        self.timePassed = 0
        self.curentFrame = Math:wrap(self.curentFrame + 1, 1, #self.currentAnimation.quads)
    else
        self.timePassed = self.timePassed + dt
    end

end

function AnimatedSprite:onDraw()
    if self.quad ~= nil then
        local x0, y0 = self:getLeftTop()
        love.graphics.draw(self.image, self.quad, x0, y0)
    end
end

return AnimatedSprite