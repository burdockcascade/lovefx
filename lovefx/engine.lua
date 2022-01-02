Node = require('lovefx.node')
Scene = require('lovefx.scene')

Camera = require('lovefx.camera')

-- physics
PhysicsWorld = require('lovefx.nodes.physics.physics_world')
PhysicsBody = require('lovefx.nodes.physics.physics_body')
CollisionShape = require('lovefx.nodes.physics.collision_shape')
Sprite = require('lovefx.nodes.graphics.sprite')

-- ui
Label = require('lovefx.nodes.ui.label')

-- util
Color = require('lovefx.util.color')

-- shapes
Rectangle = require('lovefx.nodes.graphics.rectangle')
Circle = require('lovefx.nodes.graphics.circle')

-- media
AudioPlayer = require('lovefx.nodes.multimedia.audio_player')

-- cache
Resources = {}


-- Base App
App = Node:extend()

app = App()

function App:new()
    
    self.scene = Node()
    self:addChild(self.scene)

    App.super.new(self)

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