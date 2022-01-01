local Node = require 'lovefx.node'
local Scene = require 'lovefx.scene'
local App = Node:extend()

function love.load()
    scene:load()
end

function love.update(dt)
    scene:update(dt)
end

function love.draw()
    scene:draw()
end

function App:new()

    local scene = Scene(320, 480)

end

function App:run()
    scene:addChild(self)
end

return App