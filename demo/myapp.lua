require('lovefx.lovefx')
local MyApp = App:extend()

local Frame = require 'lovefx.widgets.gui.frame'

function MyApp:onLoad()

    local frame = Frame({x = 10, y = 10, h = 400, w = 100})
    self:addChild(frame)


end

MyApp():run()