local Node = require 'lovefx.node'
local Scene = require 'lovefx.scene'
local App = Node:extend()

local scene = Scene(320, 480)

function love.load()
    scene:load()
end

function love.update(dt)
    scene:update(dt)
end

function love.draw()
    scene:draw()
end

function App:run()
    scene:addChild(self)
end

return App