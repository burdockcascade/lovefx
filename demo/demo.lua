require('lovefx.lovefx')


local cache = {
    whale = love.graphics.newImage("demo/assets/love2dwhale.png", {}),
    bombing_font = love.graphics.newFont('demo/assets/Bombing.ttf', 52),
    playfair_font = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)
}

local app = MyApp()

function App:new()
    
    self.scene = Scene(320, 480)

    -- local button = Button({x = 150, y = 150, text = "Button"})
    -- self:addChild(button)

    local title2 = Label({x = self.w/2, y = 10, font = cache.bombing_font, text = "I AM TEXT"})
    scene:addChild(title2)

    -- whales
    for i = 10,1,-1 do 
        scene:add_whale_img()
    end

    -- hello world
    for i = 2,1,-1 do 
        scene:add_hello_world()
    end    

    --
    scene:add_whale_count()

    local rect = Rect({x = 60, y = 60, w = 70, h = 20, color = Color.Blue, mode = 'fill'})
    scene:addChild(rect)

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

    local timer = Timer({timeout = 1})

    timer:setTimeoutHandler(function()
        counter = counter + 1
        title2:setText("whale burps " .. tostring(counter))
        title2:setRotation(title2.r + 0.1)
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
    timer2:setTimeout(1)
    timer2:setTimeoutHandler(function()
        -- sprite:setPosition(sprite.x + 1, sprite.y + 1)
        sprite:setRotation(sprite.r + 0.1)
    end)
    self:addChild(timer2)

end

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end