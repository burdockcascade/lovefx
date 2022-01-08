Node = require('lovefx.nodes.node')
Scene = require('lovefx.nodes.scene')
Group = require('lovefx.nodes.group')

Camera = require('lovefx.nodes.camera')
Debug = require('lovefx.nodes.debug')
Timer = require('lovefx.nodes.timer')

Tilemap = require('lovefx.nodes.tilemap.tilemap')

-- physics
PhysicsWorld = require('lovefx.nodes.physics.physics_world')
PhysicsBody = require('lovefx.nodes.physics.physics_body')
CollisionShape = require('lovefx.nodes.physics.collision_shape')
Image = require('lovefx.nodes.graphics.image')

-- ui
Label = require('lovefx.nodes.ui.label')
Button = require('lovefx.nodes.ui.button')
Container = require('lovefx.nodes.ui.containers.container')
HBox = require('lovefx.nodes.ui.containers.hbox')
VBox = require('lovefx.nodes.ui.containers.vbox')

-- util
Color = require('lovefx.util.color')
Spritesheet = require('lovefx.util.spritesheet')

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