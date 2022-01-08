local Object = require 'lovefx.thirdparty.classic.classic'
local Spritesheet = Object:extend()

function Spritesheet:new(args)

    if args.src == nil then
        error("no source for spritesheet")
    end

    self.image = args.src
    self.tileW = args.tileW or 64
    self.tileH = args.tileH or 64


    Spritesheet.super.new(self)
end

function Spritesheet:getSprite(x, y)
    return love.graphics.newQuad(self.tileW * x, self.tileH * y, self.tileW, self.tileH, self.image)
end

return Spritesheet