require('lovefx.engine')
local TileGame = Node:extend()

function TileGame:new()
    
    self.scene = Node()
    self:addChild(self.scene)

    TileGame.super.new(self)

end

function TileGame:onLoad()

    love.graphics.setBackgroundColor(Color.Blue)

    self.cam_step = 5
    self.cam_scale = 0.1
    self.cam = Camera()
    self.scene:addChild(self.cam)

    local tmap = Tilemap({mode = Tilemap.LAYOUT_SQUARE, cellW = 16, cellH = 16})
    self.scene:addChild(tmap)

    local img = love.graphics.newImage("demo/assets/2dhero.png")
    local sheet = Spritesheet({src = img, tileW = 80, tileH = 94})

    -- local whale = love.graphics.newImage("demo/assets/love2dwhale.png")

    local dimx = 32
    local dimy = 32

    for x = 1, dimx, 1 do 
        for y = 1, dimy, 1 do 
            tmap:setCell({x = x-1, y = y-1, src = img, quad = sheet:getSprite(0, 5)})
        end
    end

    self.scene:addChild(Debug({graphics = true, nodes = true, color = Color.White}))

end

function TileGame:onUpdate()

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


end






local app = TileGame({name = "hello world demo"})

function love.load()
    app:load()
end

function love.update(dt)
    app:update(dt)
end

function love.draw()
    app:draw()
end