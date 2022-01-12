require('lovefx.engine')
local MyGame = Node:extend()

function MyGame:new(options)
    
    self.scene = Node()
    self:addChild(self.scene)

    self.canvas = Canvas()
    self:addChild(self.canvas)

    MyGame.super.new(self, options)

end

function MyGame:onLoad()

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
    local pw = PhysicsWorld({gy = 500})
    self.scene:addChild(pw)

    -- block
    pw:addChild(self:addWall(85, 500, 60, 60))
    pw:addChild(self:addRoundy(340, 250, 15))
    pw:addChild(self:addRoundy(640, 150, 5))
    pw:addChild(self:addWall(570, 450, 20, 100))

    -- ball
    for i = 20,1,-1 do 

        pw:addChild(self:addWhale(100, -250 * i, 0.3))
        pw:addChild(self:addWhale(300, -300 * i, 0.1))
        pw:addChild(self:addWhale(500, -400 * i, 0.8))

    end

    -- local player = AudioPlayer({source = Resources['audio']})
    -- self.scene:addChild(player)
    -- player:play()
    

    -- UI

    local title = Label({x = 230, y = 10, font = Resources['bombing_font'], text = "Physics Demo", color = Color("FireBrick")})
    self.canvas:addChild(title)

    local button1 = Button({x = 230, y = 40, text = "Exit", tip = "Exit the app"})
    self.canvas:addChild(button1)

    button1:onSignal("pressed", function()
        love.event.quit()
    end)    

    self.canvas:addChild(Debug({graphics = true, nodes = true}))

end

function MyGame:onUpdate()

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
function MyGame:addWhale(x, y, restitution)

    local whaleBody = PhysicsBody({x = x, y = y, bodyType = 'dynamic'})

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

function MyGame:addWall(x, y, w, h)

    local block1Body = PhysicsBody({x = x, y = y})

    local block1Shape = CollisionShape({w = w, h = h, shapeType = CollisionShape.RECTANGLE})
    block1Body:addChild(block1Shape)

    local rect = Rectangle({w = w, h = h, mode = 'fill', color = Color("LawnGreen", 1)})
    block1Body:addChild(rect)

    return block1Body

end


function MyGame:addRoundy(x, y, r)

    local block1Body = PhysicsBody({x = x, y = y})

    local block1Shape = CollisionShape({radius = r, shapeType = CollisionShape.CIRCLE})
    block1Body:addChild(block1Shape)

    local circ = Circle({radius = r, mode = 'fill', color = Color("Yellow")})
    block1Body:addChild(circ)

    return block1Body

end


local app = MyGame({name = "physics demo"})

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end