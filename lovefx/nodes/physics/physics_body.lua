local Node = require('lovefx.nodes.node')
local PhysicsBody = Node:extend()

function PhysicsBody:new(options)
    
    options = options or {}
    self.bodyType = options.bodyType or 'static'
    self.density = options.density or 1
    self.restitution = options.restitution or nill

    PhysicsBody.super.new(self, options)
end

function PhysicsBody:onActive()
    if self.parent and self.parent.physicsWorld then
        self.physicsWorld = self.parent.physicsWorld
        self.physicsBody = love.physics.newBody(self.parent.physicsWorld, self.x, self.y, self.bodyType)
    end    
end

function PhysicsBody:onUpdate()

    if self.physicsBody == nil then
        error("physics world is nil")
    end

    self:setPosition(self.physicsBody:getX(), self.physicsBody:getY())
    self:setRotation(self.physicsBody:getAngle())
end

return PhysicsBody