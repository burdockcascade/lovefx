local Node = require 'lovefx.node'
local CollisionShape = Node:extend()

function CollisionShape:new(params)
    
    params = params or {}
    
    self.shapeType = params.shapeType or 'rectangle'
    self.shapeRadius = params.shapeRadius or 1
    self.shapeWidth = params.shapeWidth or 1
    self.shapeHeight = params.shapeHeight or 1
    self.shapeX = params.shapeX or 1
    self.shapeY = params.shapeY or 1

    self.density = params.density or 1
    self.restitution = params.restitution or nill

    CollisionShape.super.new(self, params)
end

function CollisionShape:onLoad()

    if self.parent ~= nill and self.parent.physicsBody ~= nill then
        self.physicsBody = self.parent.physicsBody
    else
        error("not child of physics world")
    end
    
    -- make shape
    if self.shapeType == 'rectangle' then
        self.shape = love.physics.newRectangleShape(0, 0, self.shapeWidth, self.shapeHeight)
    elseif self.shapeType == 'circle' then
        self.shape = love.physics.newCircleShape(self.shapeRadius)
    else
        error("unknown collision shape")
    end

    -- attach shape to body
    self.fixture = love.physics.newFixture(self.physicsBody, self.shape, self.density)

    -- let it bounce
    if self.restitution ~= nil then
        self.fixture:setRestitutions(self.restitution) 
    end
  
end

function CollisionShape:onDraw()

    if self.shapeType == 'rectangle' then
        love.graphics.setColor(0.20, 0.20, 0.20)
        love.graphics.polygon("fill", self.physicsBody:getWorldPoints(self.shape:getPoints()))
    elseif self.shapeType == 'circle' then
        love.graphics.setColor(0.76, 0.18, 0.05)
        love.graphics.circle("fill", self.physicsBody:getX(), self.physicsBody:getY(), self.shape:getRadius())
    end

end

return CollisionShape