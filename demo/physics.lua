require('lovefx.engine')
local MyGame = Node:extend()

function MyGame:new()
    
    self.scene = Node()
    self:addChild(self.scene)

    MyGame.super.new(self)

end

function MyGame:onLoad()

    -- love.graphics.setWireframe(true)

    --initial graphics setup
    -- love.graphics.setBackgroundColor(Color.Blue) --set the background color to a nice blue
    -- love.window.setMode(650, 650) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing

    Resources['whale'] = love.graphics.newImage("demo/assets/love2dwhale.png", {})
    Resources['bombing_font'] = love.graphics.newFont('demo/assets/Bombing.ttf', 52)
    Resources['playfair_font'] = love.graphics.newFont('demo/assets/PlayfairDisplay-Regular.ttf', 22)
    Resources['audio'] = love.audio.newSource("demo/assets/foot3.ogg", "static")

    local cam = Camera()
    self.scene:addChild(cam)

    local title = Label({x = 30, y = 10, font = Resources['bombing_font'], text = "Physics Demo"})
    self.scene:addChild(title)

    -- world
    local pw = PhysicsWorld({gy = 500})
    self.scene:addChild(pw)

    -- block
    pw:addChild(self:addWall(85, 500, 20, 10))
    pw:addChild(self:addRoundy(240, 350, 15))
    pw:addChild(self:addWall(570, 450, 15, 5))

    -- ball
    pw:addChild(self:addWhale(100, -200, 0.3))
    pw:addChild(self:addWhale(300, -100, 0))
    pw:addChild(self:addWhale(500, -500, 0.8))
    pw:addChild(self:addWhale(100, -900, 0.3))
    pw:addChild(self:addWhale(300, -1000, 0))
    pw:addChild(self:addWhale(500, -1500, 0.1))
    pw:addChild(self:addWhale(390, -3000, 0.6))
    pw:addChild(self:addWhale(100, -4000, 0.6))
    pw:addChild(self:addWhale(300, -4000, 0))
    pw:addChild(self:addWhale(500, -5000, 0.9))


    local player = AudioPlayer({source = Resources['audio']})
    self.scene:addChild(player)
    player:play()
    

end

-- prefab
function MyGame:addWhale(x, y, restitution)

    local whaleBody = PhysicsBody({x = x, y = y, bodyType = 'dynamic'})

    local whaleShape = CollisionShape({shapeType = CollisionShape.CIRCLE, radius = 85, restitution = restitution})
    whaleBody:addChild(whaleShape)

    local sprite = Sprite({src = Resources['whale']})
    whaleBody:addChild(sprite)

    local title = Label({x = 50, y = 10, font = Resources['playfair_font'], text = "I am Whale"})
    whaleBody:addChild(title)

    local rect = Rectangle({x = -10, w = 15, h = 15, mode = 'line'})
    whaleBody:addChild(rect)

    local circ = Circle({x = -30, y = -40, radius = 20, mode = 'fill'})
    whaleBody:addChild(circ)

    return whaleBody

end

function MyGame:addWall(x, y, w, h)

    local block1Body = PhysicsBody({x = x, y = y})

    local block1Shape = CollisionShape({w = w, h = h, shapeType = CollisionShape.RECTANGLE})
    block1Body:addChild(block1Shape)

    local rect = Rectangle({w = w, h = h, mode = 'fill'})
    block1Body:addChild(rect)

    return block1Body

end


function MyGame:addRoundy(x, y, r)

    local block1Body = PhysicsBody({x = x, y = y})

    local block1Shape = CollisionShape({radius = r, shapeType = CollisionShape.CIRCLE})
    block1Body:addChild(block1Shape)

    local circ = Circle({radius = r, mode = 'fill'})
    block1Body:addChild(circ)

    return block1Body

end


local app = MyGame()

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end