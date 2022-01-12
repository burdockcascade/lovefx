require('lovefx.engine')
local Notepad = Node:extend()

function Notepad:new(options)

    self.scene = Canvas()
    self:addChild(self.scene)

    love.graphics.setBackgroundColor(Color("grey")) --set the background color to a nice blue

    Notepad.super.new(self, options)

    -- frame
    local mainscreen = VBox({anchorX = 0, anchorY = 0})
    self.scene:addChild(mainscreen)

    -- menubar
    local menubar = HBox({anchorX = 0, anchorY = 0, spacing = 5})
    mainscreen:addChild(menubar)

    local button1 = Button({text = "File"})
    menubar:addChild(button1)

    local button2 = Button({text = "Edit"})
    menubar:addChild(button2)

    -- middle panes
    local midpanes = HBox({anchorX = 0, anchorY = 0, spacing = 5})
    mainscreen:addChild(midpanes)

    local frame1 = Frame()
    mainscreen:addChild(frame1)

    local frame2 = Frame()
    mainscreen:addChild(frame2)

    local frame3 = Frame()
    mainscreen:addChild(frame3)
    


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