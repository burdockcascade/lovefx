require('lovefx.engine')
local SimpleApp = Node:extend()

function SimpleApp:new(options)

    Resources['whale'] = love.graphics.newImage("demo/assets/love2dwhale.png", {}),
    
    self.scene = Node()
    self:addChild(self.scene)

    local layout = HBox({x = 100, y = 100})
    self.scene:addChild(layout)


    for i in 4, 1, 1 do
        layout:addChild(Image({src = Resources.whale}))
    end


    SimpleApp.super.new(self, options)

end

local app = SimpleApp({name = "myapp demo"})

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end