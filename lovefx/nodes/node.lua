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

    -- root of node tree
    self.root = nil
    self.parent = nil

    -- position
    self.x = options.x or 0
    self.y = options.y or 0

    -- rad
    self.rotation = options.rotation or 0

    -- anchor (defauly center)
    self.anchorX = options.anchorX or 0.5
    self.anchorY = options.anchorY or 0.5
    -- self.anchorRight = options.anchorRight or 0.5
    -- self.anchorBottom = options.anchorBottom or 0.5

    -- size
    self.w = options.w or 0
    self.h = options.h or 0

    -- scale
    self.scaleX = options.scaleX or 1
    self.scaleY = options.scaleY or 1

    -- graphics
    self.color = options.color or {255, 255, 255, 255}

    -- visibility
    self.visible = options.visible or true

    -- signals
    self.signalCallbacks = {}

    -- transform
    self.transform = love.math.newTransform(self.x, self.y, self.r, self.scaleX, self.scaleY)
    self.dirty = self.DIRTY_NONE

end

-----------------------------------------------------------
-- Load

function Node:load()

    self.dirty = self.DIRTY_ALL

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
-- Event

function Node:event(evt, ...)

    if self.onEvent ~= nil then
        self:onEvent(evt, ...)
    end

    if self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:event(evt, ...)
        end
    end

end

-----------------------------------------------------------
-- Update

function Node:update(dt)

    -- recalculate height and width if dirty
    -- if self.parent ~= nil and self.dirty ~= Node.DIRTY_NONE then
    --     self.w = math.max(self.w, self.parent.w * self.anchorRight)
    --     self.h = math.max(self.h, self.parent.h * self.anchorBottom)
    -- end
      
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
        self:updateTransform(self.dirty == Node.DIRTY_ALL)
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
    
    -- remove node from existing parent
    if node.parent ~= nil then
        node.parent:removeChild(node)
    end

    -- add parent
    node.parent = self    

    -- set root
    node.root = self.root or self

    -- keep track of children
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

    -- callbback
    if self.onChildAdded then
        self:onChildAdded(node)
    end
    
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

    if self.onChildRemoved then
        self:onChildRemoved(node)
    end

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

function Node:translatePosition(x, y)
    self:setPosition(self.x + x, self.y + y)
end

function Node:setRotation(rotation)
    self.rotation = rotation
    self.dirty = self.DIRTY_ME
end

function Node:translateRotation(rotation)
    self:setRotation(self.rotation + rotation)
end

function Node:setSize(w, h)
    self.w = w
    self.h = h
    self.dirty = self.DIRTY_ALL
end

function Node:translateSize(w, h)
    self:setSize(self.w + w, self.h)
end

function Node:setScale(scaleX, scaleY)
    self.scaleX = scaleX
    self.scaleY = scaleY
    self.dirty = self.DIRTY_ME
end

function Node:translateScale(scaleX, scaleY)
    self:setScale(self.scaleX + scaleX, self.scaleY + scaleY)
end

function Node:setAnchor(anchorY, anchorX, anchorBottom, anchorRight)
    self.anchorX = anchorX
    self.anchorY = anchorY
    self.dirty = self.DIRTY_ALL
end

function Node:getLeftTop()
    return -self.w * self.anchorX, -self.h * self.anchorY
end

function Node:updateTransform(needPropagation)

    local x = self.x
    local y = self.y
    
    if self.parent ~= nil then
        local p = self.parent
        x = x - p.w * p.anchorX
        y = y - p.h * p.anchorY
    end
    
    self.transform:setTransformation(x, y, self.rotation, self.scaleX, self.scaleY)
    self.finalTransform = nil
    self.dirty = Node.DIRTY_NONE

    -- is this needed?
    if needPropagation and self.children ~= nil then
        for i = 1, #self.children do
            self.children[i]:updateTransform(needPropagation)
        end
    end
    
end

function Node:containsPoint(px, py)

    -- transform
    local finalTransform = (self.dirty == Node.DIRTY_NONE and self.finalTransform) or nil

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
    local x1, y1 = finalTransform:transformPoint(-self.w * self.anchorX, -self.h * self.anchorY)
    local x2, y2 = finalTransform:transformPoint(self.w * (1 - self.anchorX), self.h * (1 - self.anchorY))

    -- fix rotation transform
    local gx, gy = px, py

    return gx >= x1 and gx <= x2 and gy >= y1 and gy <= y2
end

-----------------------------------------------------------
-- End

return Node