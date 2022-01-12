require('lovefx.engine')
local SpriteDemo = Node:extend()

function SpriteDemo:new()
    
    self.scene = Node()
    self:addChild(self.scene)

    SpriteDemo.super.new(self)

end

function SpriteDemo:onLoad()

    love.graphics.setBackgroundColor(Color.Black)

    -- create spritesheet
    local sheet = Spritesheet({src = love.graphics.newImage("demo/assets/2dhero.png"), tileW = 80, tileH = 94})

    local title = Label({x = 200, y = 50, text = "Sprite Demo"})
    self.scene:addChild(title)

    -- add sprite to scene
    local sprite = Sprite({x = 200, y = 100, spritesheet = sheet, cellX = 1, cellY = 1})
    self.scene:addChild(sprite)  

    local walk_frames = {{x=1,y=2}, {x=2,y=2}, {x=3,y=2}, {x=4,y=2}, {x=5,y=2}, {x=6,y=2}}
    local idle_frames = {{x=1,y=1}, {x=2,y=1}, {x=3,y=1}, {x=2,y=1}}

    -- add animated sprite to scene
    local ani1 = AnimatedSprite({x = 300, y = 200, spritesheet = sheet})
    ani1:addAnimation("idle", 4, idle_frames)
    ani1:addAnimation("walk", 12, walk_frames)
    ani1:playAnimation("walk")
    self.scene:addChild(ani1)

    local ani2 = AnimatedSprite({x = 350, y = 350, spritesheet = sheet})
    ani2:addAnimation("idle", 4, idle_frames)
    ani2:addAnimation("walk", 12, walk_frames)
    ani2:playAnimation("idle")
    self.scene:addChild(ani2)

    self.scene:addChild(Debug({graphics = true, nodes = true, color = Color.White}))

end

local app = SpriteDemo({name = "sprites demo"})

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end