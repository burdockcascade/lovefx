local Node = require 'lovefx.node'
-- local Scene = require 'lovefx.scene'
local MyGame = Node:extend()

local PhysicsWorld = require('lovefx.nodes.physics.physics_world')
local PhysicsBody = require('lovefx.nodes.physics.physics_body')
local CollisionShape = require('lovefx.nodes.physics.collision_shape')
local Sprite = require('lovefx.nodes.graphics.sprite')
local Rectangle = require('lovefx.nodes.graphics.rectangle')
local Label = require('lovefx.nodes.ui.label')
local Color = require('lovefx.util.color')

local cache = {
    whale = love.graphics.newImage("demo/assets/love2dwhale.png", {}),
    bombing_font = love.graphics.newFont('demo/assets/Bombing.ttf', 52),
    playfair_font = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)
}

function MyGame:new()
    
    self.scene = Node()
    self:addChild(self.scene)

    local title = Label({x = 100, y = 100, font = cache.bombing_font, text = "Physics Demo"})
    self.scene:addChild(title)

    MyGame.super.new(self)

end

function MyGame:onLoad()

    -- love.graphics.setWireframe(true)

    --initial graphics setup
    -- love.graphics.setBackgroundColor(Color.Blue) --set the background color to a nice blue
    -- love.window.setMode(650, 650) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing

    -- world
    local pw = PhysicsWorld({gy = 500})
    self.scene:addChild(pw)

    -- block
    pw:addChild(self:addWall(100, 500, 100, 50))
    pw:addChild(self:addWall(390, 350, 15, 15))
    pw:addChild(self:addWall(570, 450, 15, 5))

    -- ball
    pw:addChild(self:addWhale(100, -200, 0.3))
    pw:addChild(self:addWhale(300, -100, 0))
    pw:addChild(self:addWhale(500, -500, 0.1))
    pw:addChild(self:addWhale(100, -900, 0.3))
    pw:addChild(self:addWhale(300, -1000, 0))
    pw:addChild(self:addWhale(500, -1500, 0.1))
    pw:addChild(self:addWhale(350, -3000, 0.6))
    pw:addChild(self:addWhale(100, -4000, 0.6))
    pw:addChild(self:addWhale(300, -4000, 0))
    pw:addChild(self:addWhale(500, -5000, 0.9))

end

-- prefab
function MyGame:addWhale(x, y, restitution)

    local whaleBody = PhysicsBody({x = x, y = y, bodyType = 'dynamic'})

    local whaleShape = CollisionShape({shapeType = CollisionShape.CIRCLE, shapeRadius = 85, restitution = restitution})
    whaleBody:addChild(whaleShape)

    local sprite = Sprite({src = cache.whale})
    whaleBody:addChild(sprite)

    local title = Label({x = 50, y = 10, font = cache.playfair_font, text = "I am Whale"})
    whaleBody:addChild(title)

    local rect = Rectangle({w = 15, h = 15, mode = 'line'})
    whaleBody:addChild(rect)

    return whaleBody

end

function MyGame:addWall(x, y, w, h)

    local block1Body = PhysicsBody({x = x, y = y})

    local block1Shape = CollisionShape({w = w, h = h, shapeType = CollisionShape.RECTANGLE})
    block1Body:addChild(block1Shape)

    local rect = Rectangle({w = w, h = h, mode = 'fill'})
    block1Body:addChild(rect)

    return block1Body

end


local app = MyGame()

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end