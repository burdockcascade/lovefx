local Object = require 'lovefx.thirdparty.classic.classic'
local Vector = Object:extend()

function Vector:new()
    Vector.super.new(self)
end

return Vector