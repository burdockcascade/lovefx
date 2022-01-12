require('lovefx.engine')
local Notepad = Node:extend()

function Notepad:new(options)

    self.scene = Node()
    self:addChild(self.scene)

    love.graphics.setBackgroundColor(Color.White) --set the background color to a nice blue

    Notepad.super.new(self, options)

    local hbox = HBox({anchorX = 0, anchorY = 0, spacing = 5})
    self.scene:addChild(hbox)

    local button1 = Button({text = "File"})
    hbox:addChild(button1)

    local button2 = Button({text = "Edit"})
    hbox:addChild(button2)


    -- self:addChild(Debug({graphics = true, nodes = true, color = Color.Black}))

end


local app = Notepad({name = "myapp demo"})

function love.load()
    app:load()
end

function love.update(dt)
    -- app:setSize(love.graphics.getWidth(), love.graphics.getHeight())
    app:update(dt)
end

function love.draw()
    app:draw()
end