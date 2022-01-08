local Node = require('lovefx.nodes.node')
local Tilemap = Node:extend()

Tilemap.MAX_DIMENSION = 1024
Tilemap.LAYOUT_SQUARE = 1
Tilemap.LAYOUT_ISOMETRIC = 2

function Tilemap:new(options)

    options = options or {}

    self.mode = options.mode or Tilemap.LAYOUT_SQUARE
    self.cellW = options.cellW or 64
    self.cellH = options.cellH or 64
    self.tiles = {}

    Group.super.new(self, options)
end

function Tilemap:setCell(args)

    if args.src == nil then
        error("no source for tilemap cell")
    end

    self.tiles[(args.x * Tilemap.MAX_DIMENSION) + args.y] = {
        x = args.x,
        y = args.y,
        src = args.src,
        quad = args.quad
    }
end

function Tilemap:clearCell(args)
    self.tiles[(args.x * Tilemap.MAX_DIMENSION) + args.y] = nil
end

function Tilemap:onDraw()

    if self.mode == Tilemap.LAYOUT_SQUARE then

        for k, v in pairs(self.tiles) do
            if v ~= nil then

                local x = self.cellW * v.x
                local y = self.cellH * v.y

                if v.quad == nil then
                    love.graphics.draw(v.src, x, y)
                else
                    love.graphics.draw(v.src, v.quad, x, y)
                end
            end
        end

    end

end

function Tilemap:_isOnScreen(x, y)

    return x > love.graphics.getWidth() or y > love.graphics.getHeight()

end    




return Tilemap