local Node = require('lovefx.nodes.node')
local Timer = Node:extend()

function Timer:new(options)

    options = options or {}

    self.counter = 0.0
    self.timeout = options.timeout or 1

    Timer.super.new(self, options)
end

function Timer:onUpdate(dt)
    self.counter = self.counter + dt

    if self.counter >= self.timeout then
        self.counter = 0
        self:fireSignal("timeout", self.counter)
    end

end

function Timer:setTimeout(timeout)
    self.timeout = timeout
end

return Timer