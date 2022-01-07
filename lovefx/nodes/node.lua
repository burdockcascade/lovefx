local Object = require 'lovefx.thirdparty.classic.classic'
local Node = Object:extend()

Node.DIRTY_NONE = 0
Node.DIRTY_ME = 1
Node.DIRTY_ALL = 2

function Node:new(options)
    Node.super.new(self)

    options = options or {}

    self.name = options.name or ""
    self.description = options.description or ""

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

    -- root of node tree
    self.root = nil

    -- signals
    self.signalCallbacks = {}

    -- transform
    self.transform = love.math.newTransform(self.x, self.y, self.r, self.sx, self.sy)
    self.dirty = self.DIRTY_NONE

end

-----------------------------------------------------------
-- Load

function Node:load()

    if self.onLoad ~= nil then
        self:onLoad()
    end

    if self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:load()
        end
    end

end

-----------------------------------------------------------
-- Update

function Node:update(dt)

    if self.onUpdate ~= nil then
        self:onUpdate(dt)
    end

    if self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:update(dt)
        end
    end

end

-----------------------------------------------------------
-- Draw

function Node:draw()

    -- check for visibility
    if not self.visible then
        return
    end

    -- draw if only on screen
    if self.x < -self.w or self.y < -self.h or self.x > love.graphics.getWidth() or self.y > love.graphics.getHeight() then
        -- return
    end

    -- transform if needed
    if self.dirty ~= self.DIRTY_NONE then
        self:updateTransform()
    end

    love.graphics.push()
    love.graphics.applyTransform(self.transform)

    if self.onDraw ~= nil then
        self:onDraw()
    end

    -- call child nodes
    if self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:draw()
        end
    end

    love.graphics.pop()

end

-----------------------------------------------------------
-- Children

function Node:addChild(node, index)
    
    -- node has a parent
    if node.parent ~= nil then
        node.parent:removeChild(node)
    end

    node.root = self.root or self

    self.children = self.children or {}

    -- insert child at position or end
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

    node.root = nil
    
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

function Node:countNodesBelow()

    local count = 0

    if self.children ~= nil then
        for i = 1, #self.children do
            count = count + self.children[i]:countNodesBelow()
        end

        return count + #self.children
    end

    return count

end

-----------------------------------------------------------
-- Signals

function Node:onSignal(name, fn)
    self.signalCallbacks[name] = self.signalCallbacks[name] or {}
    table.insert(self.signalCallbacks[name], (fn))
end

function Node:fireSignal(name, ...)

    if self.signalCallbacks[name] ~= nil then
        for i = 1, #self.signalCallbacks[name] do
            self.signalCallbacks[name][i](arg)
        end
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

    -- if self.dirty == self.DIRTY_ALL and self.children ~= nil then
    --     for i = 1, #self.children do
    --         self.children[i]:updateTransform()
    --     end
    -- end

    self.dirty = self.DIRTY_NONE
end

function Node:containsPoint(x, y)

    -- transform
    local finalTransform = (self.dirty == 0 and self.finalTransform) or nil

    if finalTransform == nil then
        local nodes = { self }
        local parent = self.parent
        while parent ~= nil do
            table.insert(nodes, parent)
            parent = parent.parent
        end
        finalTransform = nodes[#nodes].transform:clone()
        for i = #nodes - 1, 1, -1 do
            finalTransform:apply(nodes[i].transform)
        end
        self.finalTransform = finalTransform
    end

    -- calculate box with global coordinates
    local x1, y1 = finalTransform:transformPoint(-self.w * self.ax, -self.h * self.ay)
    local x2, y2 = finalTransform:transformPoint(self.w * (1 - self.ax), self.h * (1 - self.ay))
    return gx >= x1 and gx <= x2 and gy >= y1 and gy <= y2
end

function Node:checkMousePressed(x, y)
    if self:containsPoint(x, y) then
        if self.onMousePressed then
            self:onMousePressed(x, y)
            return true
        end
    end
    return false
end

function Node:checkMouseReleased(x, y)
    if self.onMouseReleased then
        self:onMouseReleased(x, y)
        return true
    end
    return false
end

-----------------------------------------------------------
-- 



-----------------------------------------------------------
-- End

return Node