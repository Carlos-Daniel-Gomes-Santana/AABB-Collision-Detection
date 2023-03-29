Object = require "class"
Grid = Object:extend()

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
            self.size*i, 0,
            self.size*i, WINDOW_HEIGHT
        )
        love.graphics.line(
            0, self.size*i,
            WINDOW_WIDTH, self.size*i
        )
    end
end

return Grid
