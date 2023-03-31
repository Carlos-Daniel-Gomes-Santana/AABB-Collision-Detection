local Object = require "class"
local Grid = Object:extend()

function Grid:new(i, j, size, color)
    self.i = i
    self.j = j
    self.size = size
    self.color = color
end

function Grid:render()
    love.graphics.setColor(self.color)
    for i = self.i, self.j do
        love.graphics.line(
            self.size*i, 40,
            self.size*i, WINDOW_HEIGHT - 40
        )
        love.graphics.line(
            40, self.size*i,
            WINDOW_WIDTH - 40, self.size*i
        )
    end
end

return Grid
