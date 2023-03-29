Object = require "class"
Rectangle = Object:extend()

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
        self.x = self.x - 20
    end

    if love.keyboard.isDown(right) then
        self.x = self.x + 20
    end

    if love.keyboard.isDown(up) then
        self.y = self.y - 20
    end

    if love.keyboard.isDown(down) then
        self.y = self.y + 20
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
