require('lovefx.engine')
local SimpleApp = Node:extend()

function SimpleApp:new()
    
    self.scene = Node()
    self:addChild(self.scene)

    SimpleApp.super.new(self, options)

end

function SimpleApp:onLoad()

    local label = Label({x = 10, text = "Hello World"})
    self.scene:addChild(label)

end

local app = SimpleApp({name = "hello world demo"})

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end