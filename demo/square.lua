local App = require 'lovefx.app'
local MyGame = App:extend()

local Sprite = require 'lovefx.nodes.ui.label'


function MyGame:onLoad()

    --initial graphics setup
    -- love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
    love.window.setMode(650, 650) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing


    scene = Scene(480, 320, 'expand')

    local bigRect = Rect({ x = scene.w * 0.5, y = scene.h * 0.5, w = 200, h = 200, color = { 0, 0.5, 1, 1 }})
    scene:addChild(bigRect)

    local topLeftRect = Rect({x = 10, y = 10, w = 50, h = 50, color = { 1, 1, 1, 1 }})
    topLeftRect:updateAnchor(0, 0)
    bigRect:addChild(topLeftRect)

    local bottomText = Text({x = bigRect.w * 0.5, y = bigRect.h - 10, love.graphics.newFont(12), text = 'Bottom Text', color = { 1, 1, 1, 1}})
    bottomText:updateAnchor(0.5, 1)
    bigRect:addChild(bottomText)

    bigRect:flux(10, { r = math.pi * 2 })


end

MyGame():run()