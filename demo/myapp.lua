require('lovefx.engine')
local SimpleApp = Node:extend()

function SimpleApp:new(options)

    self.scene = Node()
    self:addChild(self.scene)

    love.graphics.setBackgroundColor(Color.White) --set the background color to a nice blue

    SimpleApp.super.new(self, options)

    -- camera
    self.cam_step = 10
    self.cam_scale = 0.1
    self.cam = Camera()
    self:addChild(self.cam)

    -- Resources['bombing_font'] = love.graphics.newFont('demo/assets/Bombing.ttf', 52)
    -- Resources['playfair_font'] = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)

    -- local con = Rectangle({mode = 'fill', color = Color.Blue, anchorX = 0, anchorY = 0, w =800, h = 600})
    -- self:addChild(con)

    local hbox = HBox({x = 20, y = 20, anchorX = 0, anchorY = 0, spacing = 5})
    self.scene:addChild(hbox)

    local button1 = Button({text = "Exit", tip = "Exit the app"})
    hbox:addChild(button1)

    button1:onSignal("pressed", function()
        love.event.quit()
    end)

    local button2 = Button({text = "Cancel"})
    hbox:addChild(button2)


    local hbox2 = HBox({x = 120, y = 120, anchorX = 0, anchorY = 0, spacing = 5})
    self.scene:addChild(hbox2)

    local button121 = Button({text = "New"})
    hbox2:addChild(button121)

    local button212 = Button({text = "Load"})
    hbox2:addChild(button212)    

    local button11 = Button({text = "Save"})
    hbox2:addChild(button11)

    local button21 = Button({text = "Cancel"})
    hbox2:addChild(button21)



    local vbox = VBox({x = 100, y = 300, anchorX = 0, anchorY = 0, spacing = 10})
    self.scene:addChild(vbox)

    local button4 = Button({text = "Another Button With Some Very Very Long Text"})
    vbox:addChild(button4)

    local button5 = Button({text = "Short Text"})
    vbox:addChild(button5)

    local button6 = Button({text = "Centered Button", extendWidthHorizontal = true})
    vbox:addChild(button6)

    -- self:addChild(Debug({graphics = true, nodes = true, color = Color.Black}))

end

-- function SimpleApp:onUpdate()

--     if love.keyboard.isDown("down") then
--         self.cam:translatePosition(0, -self.cam_step)
--     elseif love.keyboard.isDown("up") then
--         self.cam:translatePosition(0, self.cam_step)
--     end
    
--     if love.keyboard.isDown("left") then
--         self.cam:translatePosition(self.cam_step, 0)  
--     elseif love.keyboard.isDown("right") then
--         self.cam:translatePosition(-self.cam_step, 0)
--     end

--     if love.keyboard.isDown("[") then
--         self.cam:translateScale(self.cam_scale, self.cam_scale)
--     elseif love.keyboard.isDown("]") then
--         self.cam:translateScale(-self.cam_scale, -self.cam_scale)
--     end

--     if love.keyboard.isDown(",") then
--         self.cam:translateRotation(0.1)
--     elseif love.keyboard.isDown(".") then
--         self.cam:translateRotation(-0.1)
--     end

-- end

local app = SimpleApp({name = "myapp demo"})

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