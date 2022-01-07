require('lovefx.engine')
local SimpleApp = Node:extend()

function SimpleApp:new(options)

    Resources['bombing_font'] = love.graphics.newFont('demo/assets/Bombing.ttf', 52)
    Resources['playfair_font'] = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)
    
    self.scene = Node()
    self:addChild(self.scene)

    local hbox = HBox({x = 100, y = 100})
    self.scene:addChild(hbox)

    local button1 = Button({text = "Button 1"})
    hbox:addChild(button1)

    local button2 = Button({text = "Button Two"})
    hbox:addChild(button2)

    local button3 = Button({text = "Next Button 3"})
    hbox:addChild(button3)




    local vbox = VBox({x = 200, y = 200})
    self.scene:addChild(vbox)

    local button4 = Button({text = "Another Button 4"})
    vbox:addChild(button4)

    local button5 = Button({text = "Button 5"})
    vbox:addChild(button5)

    local button6 = Button({text = "Button Six"})
    vbox:addChild(button6)



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