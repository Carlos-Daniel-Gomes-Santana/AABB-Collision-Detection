local Object = require "class"
local Rectangle = Object:extend()

function Rectangle:new(x, y, width, height, color)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.color = color
end

function Rectangle:update(type)
    local left = type == 2 and "left" or "a"
    local right = type == 2 and "right" or "d"
    local up = type == 2 and "up" or "w"
    local down = type == 2 and "down" or "s"

    if love.keyboard.isDown(left) then
        if not (self.x == 0) then
            self.x = self.x - 20
        end
    end

    if love.keyboard.isDown(right) then
        if not (self.x + self.width == WINDOW_WIDTH) then
            self.x = self.x + 20
        end
    end

    if love.keyboard.isDown(up) then
        if not (self.y == 0) then
            self.y = self.y - 20
        end
    end

    if love.keyboard.isDown(down) then
        if not (self.y + self.height == WINDOW_HEIGHT) then
            self.y = self.y + 20
        end
    end
end

function Rectangle:render()
    love.graphics.setColor(self.color)
    love.graphics.rectangle(
        "line",
        self.x,
        self.y,
        self.width,
        self.height
    )
end

return Rectangle
