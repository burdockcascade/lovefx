require('lovefx.engine')

function App:onActive()
   
    self.scene = Node()
    self:addChild(self.scene)

    self.canvas = Canvas()
    self:addChild(self.canvas)

    -- love.graphics.setWireframe(true)

    --initial graphics setup
    love.graphics.setBackgroundColor(Color("RoyalBlue")) --set the background color to a nice blue
    -- love.window.setMode(650, 650) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing

    Resources['whale'] = love.graphics.newImage("demo/assets/love2dwhale.png", {})
    Resources['bombing_font'] = love.graphics.newFont('demo/assets/Bombing.ttf', 52)
    Resources['playfair_font'] = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)
    Resources['audio'] = love.audio.newSource("demo/assets/foot3.ogg", "static")

    -- camera
    self.cam = Camera()
    self.scene:addChild(self.cam)

    -- step
    self.cam_step = 5
    self.cam_scale = 0.1

    -- world
    self.pw = PhysicsWorld({gy = 500})
    self.scene:addChild(self.pw)

    -- block
    self:addWall(185, 500, 190, 10)
    self:addRoundy(340, 250, 15)
    self:addRoundy(640, 150, 5)
    self:addWall(570, 450, 20, 100)

    -- whale
    for i = 10,1,-1 do 
        self:addWhale()
    end

    -- local player = AudioPlayer({source = Resources['audio']})
    -- self.scene:addChild(player)
    -- player:play()
    

    -- UI

    local title = Label({x = 230, y = 10, font = Resources['bombing_font'], text = "Physics Demo", color = Color("FireBrick")})
    self.canvas:addChild(title)

    local hbox = HBox({x = 230, y = 40, spacing = 2})
    self.canvas:addChild(hbox)

    local button1 = Button({text = "More Whales"})
    hbox:addChild(button1)

    button1:onSignal("pressed", function()
        for i = 3,1,-1 do 
            self:addWhale()
        end
    end)    

    local button2 = Button({text = "Exit", tip = "Exit the app"})
    hbox:addChild(button2)

    button2:onSignal("pressed", function()
        love.event.quit()
    end)    

    self.canvas:addChild(Debug({graphics = true, nodes = true}))

end

function App:onUpdate()

    if love.keyboard.isDown("down") then
        self.cam:translatePosition(0, -self.cam_step)
    elseif love.keyboard.isDown("up") then
        self.cam:translatePosition(0, self.cam_step)
    end
    
    if love.keyboard.isDown("left") then
        self.cam:translatePosition(self.cam_step, 0)  
    elseif love.keyboard.isDown("right") then
        self.cam:translatePosition(-self.cam_step, 0)
    end

    if love.keyboard.isDown("[") then
        self.cam:translateScale(self.cam_scale, self.cam_scale)
    elseif love.keyboard.isDown("]") then
        self.cam:translateScale(-self.cam_scale, -self.cam_scale)
    end

    if love.keyboard.isDown(",") then
        self.cam:translateRotation(0.1)
    elseif love.keyboard.isDown(".") then
        self.cam:translateRotation(-0.1)
    end

end

-- prefab
function App:addWhale()

    local x = love.math.random(0, 800)
    local y = love.math.random(-100, -300)
    local restitution = love.math.random(0, 1)

    local whaleBody = PhysicsBody({x = x, y = y, bodyType = 'dynamic'})
    self.pw:addChild(whaleBody)

    local whaleShape = CollisionShape({shapeType = CollisionShape.CIRCLE, radius = 85, restitution = restitution})
    whaleBody:addChild(whaleShape)

    local sprite = Image({src = Resources['whale']})

    whaleBody:addChild(sprite)

    local title = Label({x = 50, y = 10, font = Resources['playfair_font'], text = "I am Whale", color = Color("Fuchsia")})
    whaleBody:addChild(title)

    local rect = Rectangle({x = -10, w = 15, h = 15, mode = 'line', color = Color("SeaShell", 0.5)})
    whaleBody:addChild(rect)

    local circ = Circle({x = -15, y = -15, radius = 20, mode = 'fill', color = Color("Peru")})
    whaleBody:addChild(circ)

    return whaleBody

end

function App:addWall(x, y, w, h)

    local block1Body = PhysicsBody({x = x, y = y})
    self.pw:addChild(block1Body)

    local block1Shape = CollisionShape({w = w, h = h, shapeType = CollisionShape.RECTANGLE})
    block1Body:addChild(block1Shape)

    local rect = Rectangle({w = w, h = h, mode = 'fill', color = Color("LawnGreen", 1)})
    block1Body:addChild(rect)

    return block1Body

end


function App:addRoundy(x, y, r)

    local block1Body = PhysicsBody({x = x, y = y})
    self.pw:addChild(block1Body)

    local block1Shape = CollisionShape({radius = r, shapeType = CollisionShape.CIRCLE})
    block1Body:addChild(block1Shape)

    local circ = Circle({radius = r, mode = 'fill', color = Color("Yellow")})
    block1Body:addChild(circ)

    return block1Body

end

