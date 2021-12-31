local Node = require 'lovefx.node'
local Timer = Node:extend()

function Timer:new(params)

    params = params or {}

    self.counter = 0.0
    self.timeout = params.timeout or 1
    self.cb = params.cb

    Timer.super.new(self, params)
end

function Timer:onUpdate(dt)
    self.counter = self.counter + dt

    if self.counter >= self.timeout then
        self.counter = 0
        if self.cb ~= nil then self.cb() end
    end

end

function Timer:setTimeoutHandler(cb)
    self.cb = cb
end

function Timer:setTimeout(timeout)
    self.timeout = timeout
end

return Timer