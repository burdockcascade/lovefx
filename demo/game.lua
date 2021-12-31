local App = require 'lovefx.app'
local MyGame = App:extend()

local PhysicsWorld = require 'lovefx.nodes.physics.physics_world'
local PhysicsBody = require 'lovefx.nodes.physics.physics_body'
local CollisionShape = require 'lovefx.nodes.physics.collision_shape'

function MyGame:onLoad()

    --initial graphics setup
    -- love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
    love.window.setMode(650, 650) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing


    -- world
    local pw = PhysicsWorld({gy = 9.81*64})
    self:addChild(pw)

    -- ball
    self:addBall(pw, 110, 150)
    self:addBall(pw, 100, 100)
    self:addBall(pw, 140, 180)


    -- block
    local block1Body = PhysicsBody({bodyX = 255, bodyY = 300})
    pw:addChild(block1Body)

    local block1Shape = CollisionShape({shapeWidth = 300, shapeHeight = 50, shapeType = 'rectangle'})
    block1Body:addChild(block1Shape)
   


end

function MyGame:addBall(pw, x, y)

    local ballBody = PhysicsBody({bodyX = x, bodyY = y, bodyType = 'dynamic'})
    pw:addChild(ballBody)

    local ballShape = CollisionShape({shapeType = 'circle', shapeRadius = 20})
    ballBody:addChild(ballShape)

end

MyGame():run()