local Label = require 'lovefx.widgets.label'
local Button = require 'lovefx.widgets.button'
local HBox = require 'lovefx.widgets.hbox'
local DebugOverlay = require 'lovefx.widgets.debug_overlay'
local Scene = require 'lovefx.scene'

local scene

local cache = {
    whale = love.graphics.newImage("demo/assets/love2dwhale.png", {}),
    bombing_font = love.graphics.newFont('demo/assets/Bombing.ttf', 52),
    playfair_font = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)
}

function love.load()

    scene = Scene(480, 320)
    scene.visible = false

    -- local label1 = Label({x = 0, y = 0, text = "Line 1"})
    -- local label2 = Label({x = 0, y = 0, text = "Line 2"})
    -- local label3 = Label({x = 0, y = 0, text = "Line 3"})

    local button1 = Button({text = "Button1"})
    local button2 = Button({text = "Button2"})
    local button3 = Button({text = "Button3"})
    

    -- local hbox = HBox({x = 200, y = 200})
    -- hbox:addChild(button1)
    -- hbox:addChild(button2)
    -- hbox:addChild(button3)


    scene:addChild(button1)

    --
    -- scene:addChild(DebugOverlay())
    scene:load()

    
    


    scene.visible = true

end


function love.update(dt)
    scene:update(dt)
end

function love.draw()
    scene:draw()
end