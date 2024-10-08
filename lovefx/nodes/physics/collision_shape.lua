local Node = require 'lovefx.nodes.node'
local CollisionShape = Node:extend()

CollisionShape.RECTANGLE = 'rectangle'
CollisionShape.CIRCLE = 'circle'

function CollisionShape:new(options)
    
    options = options or {}
    
    self.shapeType = options.shapeType or CollisionShape.RECTANGLE
    self.radius = options.radius or 1
    self.density = options.density or 1
    self.restitution = options.restitution or nill

    CollisionShape.super.new(self, options)
end

function CollisionShape:onActive()

    if self.parent ~= nill and self.parent.physicsBody ~= nill then
        self.physicsBody = self.parent.physicsBody
    else
        error("physics body is nil")
    end

    -- make shape
    if self.shapeType == CollisionShape.RECTANGLE then
        self.shape = love.physics.newRectangleShape(0, 0, self.w, self.h)
    elseif self.shapeType == CollisionShape.CIRCLE then
        self.shape = love.physics.newCircleShape(self.radius)
    else
        error("unknown collision shape")
    end

    -- attach shape to body
    self.fixture = love.physics.newFixture(self.physicsBody, self.shape, self.density)

    -- let it bounce
    if self.restitution ~= nil then
        self.fixture:setRestitution(self.restitution) 
    end
  
end

return CollisionShape