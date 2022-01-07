local Node = require('lovefx.nodes.node')
local Debug = Node:extend()

function Debug:new(options)

    options = options or {}
    self.graphics = options.graphics or false
    self.nodes = options.nodes or false

    self.line = 0
    self.space = 20

    Debug.super.new(self, options)
end

function Debug:onDraw()

    self:printLine("Current FPS: "..tostring(love.timer.getFPS()))
    self:printLine("Lua Memory Usage: "..tostring(math.floor(collectgarbage("count"))).."k")
    
    if self.graphics then

        local stats = love.graphics.getStats()

        self:printLine("--")
        self:printLine("draw calls: " ..  stats.drawcalls)
        self:printLine("batched calls: " ..  stats.drawcallsbatched)
        self:printLine("draws saved: " ..  stats.drawcallsbatched)
        self:printLine("images: " ..  stats.images)    
        self:printLine("fonts: " ..  stats.fonts)    
        self:printLine("canvases: " ..  stats.canvases)    
        self:printLine("texture memory: " ..  stats.texturememory)    
            
    end

    if self.nodes then
        self:printLine("--")    
        self:printLine("root node: " ..  self.root.name)    
        self:printLine("nodes: " ..  self.root:countNodesBelow())    
    end

    self.line = 0

end

function Debug:printLine(text)

    self.line = self.line + self.space

    love.graphics.print(text, 10, self.line)
    

end


return Debug