local App = require 'lovefx.app'
local MyApp = App:extend()

local Label = require 'lovefx.widgets.gui.label'
local Button = require 'lovefx.widgets.gui.button'
local Sprite = require 'lovefx.widgets.gui.image'
local DebugOverlay = require 'lovefx.widgets.debug_overlay'
local Color = require 'lovefx.util.color'
local Scene = require 'lovefx.scene'
local Timer = require 'lovefx.widgets.extra.timer'
local Rect = require 'lovefx.widgets.gui.rect'

local cache = {
    whale = love.graphics.newImage("demo/assets/love2dwhale.png", {}),
    bombing_font = love.graphics.newFont('demo/assets/Bombing.ttf', 52),
    playfair_font = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)
}

function MyApp:onLoad()

    -- local button = Button({x = 150, y = 150, text = "Button"})
    -- self:addChild(button)

    -- whales
    for i = 10,1,-1 do 
        -- self:add_whale_img()
    end

    -- hello world
    for i = 2,1,-1 do 
        self:add_hello_world()
    end    

    --
    -- self:add_whale_count()

    local rect = Rect({x = 60, y = 60, w = 70, h = 70, color = Color.blue})
    self:addChild(rect)

end

function MyApp:add_hello_world()
    local x = love.math.random(0, 480)
    local y = love.math.random(0, 320)
    local s = love.math.random(6, 90)

    local title = Label({x = x, y = y, font = cache.playfair_font, text = "Hello World"})
    self:addChild(title)
end

function MyApp:add_whale_count()

    local title2 = Label({x = 150, y = 150, font = cache.bombing_font, text = "whale burps 0"})
    self:addChild(title2)

    local counter = 0

    local timer = Timer({timeout = 0})

    timer:setTimeoutHandler(function()
        counter = counter + 1
        title2:setText("whale burps " .. tostring(counter))
        title2.r = title2.r + 0.1
    end)

    self:addChild(timer)

end

function MyApp:add_whale_img()

    local r = love.math.random(0, 1)
    local t = love.math.random(0, 3)
    local x = love.math.random(0, 480)
    local y = love.math.random(0, 320)

    local sprite = Sprite({x = x, y = y, src = cache.whale})
    self:addChild(sprite)

    local timer2 = Timer()
    timer2:setTimeout(0)
    timer2:setTimeoutHandler(function()
        sprite.r = sprite.r + 0.1
    end)
    self:addChild(timer2)

end

MyApp():run()