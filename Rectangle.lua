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
        if not (self.x == 40) then
            self.x = self.x - 20
        end
    end

    if love.keyboard.isDown(right) then
        if not (self.x + self.width == WINDOW_WIDTH - 40) then
            self.x = self.x + 20
        end
    end

    if love.keyboard.isDown(up) then
        if not (self.y == 40) then
            self.y = self.y - 20
        end
    end

    if love.keyboard.isDown(down) then
        if not (self.y + self.height == WINDOW_HEIGHT - 40) then
            self.y = self.y + 20
        end
    end
end

function Rectangle:render()
    love.graphics.setColor(self.color)
    love.graphics.line(
        self.x, 40,
        self.x + self.width, 40
    )
    love.graphics.line(
        self.x, WINDOW_HEIGHT - 40,
        self.x + self.width, WINDOW_HEIGHT - 40
    )
    love.graphics.line(
        40, self.y,
        40, self.y + self.height
    )
    love.graphics.line(
        WINDOW_HEIGHT - 40, self.y,
        WINDOW_HEIGHT - 40, self.y + self.height
    )
    love.graphics.rectangle(
        "line",
        self.x,
        self.y,
        self.width,
        self.height
    )
end

return Rectangle
