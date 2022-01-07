local Object = require 'lovefx.thirdparty.classic.classic'
local Rect = Object:extend()

function Rect:new(pos, size)

    self.pos = pos
    self.size = size

    Rect.super.new(self)
end

function Rect:encloses()
    return false
end

function Rect:intersects()
    retun false
end


return Rect