local Object = require 'lovefx.thirdparty.classic.classic'
local Node = Object:extend()

function Node:new(params)
    Node.super.new(self)

    params = params or {}

    self.x = params.x or 0
    self.y = params.y or 0
    self.r = params.r or 0
    self.w = params.w or 0
    self.h = params.h or 0
    self.sx = params.sx or 1
    self.sy = params.sy or 1
    self.ax = params.ax or 0.5
    self.ay = params.ay or 0.5
    self.ox = self.w * self.ax
    self.oy = self.h * self.ay
    self.visible = params.visible or true
    self.debug = params.debug or false
end

-----------------------------------------------------------
-- Load

function Node:load()

    self:onLoad()

    if self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:load()
        end
    end
end

function Node:onLoad()
end

-----------------------------------------------------------
-- Update

function Node:update(dt)

    if not self.visible then return end

    self:onUpdate(dt)

    if self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:update(dt)
        end
    end
end

function Node:onUpdate(dt)
end

-----------------------------------------------------------
-- Draw

function Node:draw()

    if not self.visible then return end

    self:onDraw()

    if self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:draw()
        end
    end

    if self.debug then
        love.graphics.print("Current FPS: "..tostring(love.timer.getFPS()), 10, 10)
        love.graphics.print("Lua Memory Usage: "..tostring(math.floor(collectgarbage("count"))).."k", 10, 30)
        love.graphics.print("x: "..tostring(self.x)..", y: "..tostring(self.y), 10, 50)
        love.graphics.print("r: "..tostring(self.r), 10, 70)
        love.graphics.print("width: "..tostring(self.w)..", height: "..tostring(self.h), 10, 90)
        love.graphics.print("ox: "..tostring(self.ox)..", oy: "..tostring(self.oy), 10, 110)
    end

end

function Node:onDraw()
end

-----------------------------------------------------------
-- Children

function Node:addChild(node, index)
    
    if node.parent ~= nil then
        node.parent:removeChild(node)
    end

    self.children = self.children or {}

    if index ~= nil and type(index) == 'number' then
        if index < 1 or index > #self.children then
            error('Index is out of range')
            return
        end
        table.insert(self.children, index, node)
        for i = index, #self.children do
            self.children[i].indexInParent = i
        end
    else
        table.insert(self.children, node)
        node.indexInParent = #self.children
    end

    node.parent = self
end

function Node:removeChild(node)
    if node.parent ~= self then
        error('Node parent is different')
        return
    end
    
    table.remove(self.children, node.indexInParent)
    for i = index, #self.children do
        self.children[i].indexInParent = i
    end
    
    node.parent = nil
    node.indexInParent = nil
end

function Node:reorderChild(node, index)
    if node.parent ~= self then
        error('Node parent is different')
        return
    elseif index < 1 or index > #self.children then
        error('Index is out of range')
        return
    elseif index == node.indexInParent then
        return
    end

    table.remove(self.children, node.indexInParent)
    table.insert(self.children, index, node)
    for i = 1, #self.children do
        self.children[i].indexInParent = i
    end
end


return Node