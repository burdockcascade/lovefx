local Node = require('lovefx.node')
local PhysicsBody = Node:extend()

function PhysicsBody:new(options)
    
    options = options or {}
    self.bodyType = options.bodyType or 'static'
    self.density = options.density or 1
    self.restitution = options.restitution or nill

    PhysicsBody.super.new(self, options)
end

function PhysicsBody:onLoad()

    if self.parent ~= nill and self.parent.physicsWorld ~= nill then
        self.physicsWorld = self.parent.physicsWorld
    else
        error("not child of physics world")
    end

    self.physicsBody = love.physics.newBody(self.physicsWorld, self.x, self.y, self.bodyType)
    
end

function PhysicsBody:onUpdate()
    self:setPosition(self.physicsBody:getX(), self.physicsBody:getY())
    self:setRotation(self.physicsBody:getAngle())
end

return PhysicsBody