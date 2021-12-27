local Label = require 'lovefx.widgets.label'
local Button = require 'lovefx.widgets.button'
local Sprite = require 'lovefx.widgets.sprite'
local Color = require 'lovefx.util.color'
local Scene = require 'lovefx.scene'
local Timer = require 'lovefx.widgets.timer'

local scene

local title 
local counter = 0

function love.load()

    scene = Scene(480, 320)
    
    title = Label({x = scene.w * 0.5, y = 10, font = 14, text = "Hello World"})
    title:updateAnchor(0.5, 0)
    scene:addChild(title)

    local timer = Timer({timeout = 1, cb = doit})
    scene:addChild(timer)


    
    sprite = Sprite({x = scene.w * 0.5, y = 40, src = "demo/assets/love2dwhale.png"})
    scene:addChild(sprite)

    local timer = Timer({timeout = 2, cb = function()
        sprite.visible = not sprite.visible
    end})

    scene:addChild(timer)


    scene:load()

end

function doit()
    counter = counter + 1
    title:setText("whales " .. tostring(counter))
end

function love.update(dt)
    scene:update(dt)
end

function love.draw()
    scene:draw()
end