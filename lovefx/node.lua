local Object = require 'lovefx.thirdparty.classic.classic'
local Node = Object:extend()

Node.DIRTY_NONE = 0
Node.DIRTY_ME = 1
Node.DIRTY_ALL = 2

function Node:new(options)
    Node.super.new(self)

    options = options or {}

    -- print debug
    self.debug = options.debug or false

    -- position
    self.x = options.x or 0
    self.y = options.y or 0

    -- rad
    self.r = options.r or 0

    -- size
    self.w = options.w or 0
    self.h = options.h or 0

    -- scale
    self.sx = options.sx or 1
    self.sy = options.sy or 1

    -- anchor
    self.ax = options.ax or 0.5
    self.ay = options.ay or 0.5

    -- graphics
    self.color = options.color or {255, 255, 255, 255}

    -- visibility
    self.visible = options.visible or true

    -- transform
    self.transform = love.math.newTransform(self.x, self.y, self.r, self.sx, self.sy)
    self.dirty = self.DIRTY_NONE

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

    if not self.visible then
        return
    end

    if self.dirty ~= self.DIRTY_NONE then
        self:updateTransform()
    end

    love.graphics.push()
    love.graphics.applyTransform(self.transform)

    self:onDraw()

    -- call child nodes
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

    love.graphics.pop()

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

-----------------------------------------------------------
-- Transform

function Node:setPosition(x, y)
    self.x = x
    self.y = y
    self.dirty = self.DIRTY_ALL
end

function Node:setRotation(rotation)
    self.r = rotation
    self.dirty = self.DIRTY_ME
end

function Node:setSize(w, h)
    self.w = w
    self.h = h
    self.dirty = self.DIRTY_ALL
end

function Node:setScale(sx, sy)
    self.sx = sx
    self.sy = sy
    self.dirty = self.DIRTY_ME
end

function Node:setAnchor(ax, ay)
    self.ax = ax
    self.ay = ay
    self.dirty = self.DIRTY_ALL
end

function Node:getLeftTop()
    return -self.w * self.ax, -self.h * self.ay
end

function Node:updateTransform()

    local x = self.x
    local y = self.y
    
    if self.parent ~= nil then
        local p = self.parent
        x = x - p.w * p.ax
        y = y - p.h * p.ay
    end
    
    self.transform:setTransformation(x, y, self.r, self.sx, self.sy)
    self.finalTransform = nil
    self.dirty = self.DIRTY_NONE

    if self.dirty == self.DIRTY_ALL and self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:updateTransform()
        end
    end
end

-----------------------------------------------------------
-- Tween

return Node