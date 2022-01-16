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

-- graphics
Image = require('lovefx.nodes.graphics.image')
Sprite = require('lovefx.nodes.graphics.sprite')
AnimatedSprite = require('lovefx.nodes.graphics.animated_sprite')

-- ui
Canvas = require('lovefx.nodes.ui.canvas')
Panel = require('lovefx.nodes.ui.panel')
Label = require('lovefx.nodes.ui.form.label')
Button = require('lovefx.nodes.ui.form.button')
Container = require('lovefx.nodes.ui.containers.container')
HBox = require('lovefx.nodes.ui.containers.hbox')
VBox = require('lovefx.nodes.ui.containers.vbox')
InputBox = require('lovefx.nodes.ui.form.inputbox')

-- util
Color = require('lovefx.util.color')
Spritesheet = require('lovefx.util.spritesheet')
Math = require('lovefx.util.math')

-- shapes
Rectangle = require('lovefx.nodes.graphics.rectangle')
Circle = require('lovefx.nodes.graphics.circle')

-- media
AudioPlayer = require('lovefx.nodes.multimedia.audio_player')

-- cache
Resources = {}


-----------------------------------------------------------
-- App

-- Base App
App = Node:extend()

function App:new()
    
    self.scene = Node()
    self:addChild(self.scene)

    self.canvas = Canvas()
    self:addChild(self.canvas)
    

    App.super.new(self)

end

-----------------------------------------------------------
-- Enigne Loop

app = nil

function love.load()
    app = App()    
    app:onActive()
end

function love.update(dt)
    app:update(dt)
end

-----------------------------------------------------------
-- Inputs

function love.mousepressed(x, y, button, istouch, presses)
    app:input({name = "mouse-pressed", x = x, y = y, button = button, istouch = istouch, presses})
end

function love.mousereleased(x, y, button, istouch, presses)
    app:input({name = "mouse-released", x = x, y = y, button = button, istouch = istouch, presses})
end

function love.keypressed(key, scancode, isrepeat)
    app:input({name = "key-pressed", key = key, scancode = scancode, isrepeat = isrepeat})
end

function love.textinput(text)
    app:input({name = "textinput", text = text})
end

-----------------------------------------------------------
-- Draw

function love.draw()
    app:draw()
end