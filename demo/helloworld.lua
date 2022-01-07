require('lovefx.engine')
local SimpleApp = Node:extend()

function SimpleApp:new(options)
    
    self.scene = Node({w = love.graphics.getWidth(), h = love.graphics.getHeight()})
    self:addChild(self.scene)

    local label = Label({x = 10, text = "Hello World"})
    self.scene:addChild(label)

    SimpleApp.super.new(self, options)

end

local app = SimpleApp({name = "physics demo"})

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end