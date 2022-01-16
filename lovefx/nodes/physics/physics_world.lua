local Node = require 'lovefx.nodes.node'
local PhysicsWorld = Node:extend()

function PhysicsWorld:new(options)

    options = options or {}

    self.gx = options.gx or 0
    self.gy = options.gy or 0
    self.can_sleep = options.can_sleep or true

    PhysicsWorld.super.new(self, options)

    self.physicsWorld = love.physics.newWorld(self.gx, self.gy, self.can_sleep)
end

function PhysicsWorld:onUpdate(dt)
    self.physicsWorld:update(dt)
end

return PhysicsWorld