local Node = require 'lovefx.node'
local PhysicsBody = Node:extend()

function PhysicsBody:new(params)
    
    params = params or {}
    self.bodyX = params.bodyX or 0
    self.bodyY = params.bodyY or 0
    self.bodyType = params.bodyType or 'static'

    self.density = params.density or 1
    self.restitution = params.restitution or nill

    PhysicsBody.super.new(self, params)
end

function PhysicsBody:onLoad()

    if self.parent ~= nill and self.parent.physicsWorld ~= nill then
        self.physicsWorld = self.parent.physicsWorld
    else
        error("not child of physics world")
    end

    self.physicsBody = love.physics.newBody(self.physicsWorld, self.bodyX, self.bodyY, self.bodyType) 
    
end

return PhysicsBody