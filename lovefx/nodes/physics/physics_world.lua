local Node = require 'lovefx.node'
local PhysicsWorld = Node:extend()

function PhysicsWorld:new(params)

    params = params or {}

    self.gx = params.gx or 0
    self.gy = params.gy or 0
    self.can_sleep = params.can_sleep or true

    PhysicsWorld.super.new(self, params)
end

function PhysicsWorld:onLoad()
    self.physicsWorld = love.physics.newWorld(self.gx, self.gy, self.can_sleep)
end

function PhysicsWorld:onUpdate(dt)
    self.physicsWorld:update(dt)
end

return PhysicsWorld