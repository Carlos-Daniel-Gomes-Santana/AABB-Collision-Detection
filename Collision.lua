local Object = require "class"
local Collision = Object:extend()

function Collision:new(shape_1, shape_2, debug)
    self.shape_1 = shape_1
    self.shape_2 = shape_2
    self.debug = debug or false
    self.status = false
    self.point = false
    self.font = love.graphics.newFont("font.ttf", 24)
end

function Collision:update()
    self.min_x_1 = self.shape_1.x
    self.min_y_1 = self.shape_1.y
    self.max_x_1 = self.shape_1.x + self.shape_1.width
    self.max_y_1 = self.shape_1.y + self.shape_1.height

    self.min_x_2 = self.shape_2.x
    self.min_y_2 = self.shape_2.y
    self.max_x_2 = self.shape_2.x + self.shape_2.width
    self.max_y_2 = self.shape_2.y + self.shape_2.height

    local x_cond = self.min_x_1 <= self.max_x_2 and self.max_x_1 >= self.min_x_2
    local y_cond = self.min_y_1 <= self.max_y_2 and self.max_y_1 >= self.min_y_2

    local x_point = self.min_x_1 == self.max_x_2 or self.max_x_1 == self.min_x_2
    local y_point = self.min_y_1 == self.max_y_2 or self.max_y_1 == self.min_y_2

    if x_cond and y_cond then
        self.status = true
    else
        self.status = false
    end

    if x_point and y_point then
        self.point = true
    else
        self.point = false
    end

end

function Collision:render()
    love.graphics.setColor(1,1,1,1)
    if self.status and not self.point then
        local str_msg = "Collision Detected!"
        local message = love.graphics.newText(
            self.font, str_msg
        )
        love.graphics.print(
            str_msg,
            self.font,
            (WINDOW_WIDTH - message:getWidth())/2,
            10
        )
    end

    if self.debug then
        love.graphics.print("Collision: "..tostring(self.status), 40, 0)
        love.graphics.print(
            "Min_x:"..tostring(self.min_x_1)..", Max_x:"..tostring(self.max_x_1),
            40, 10
        )
        love.graphics.print(
            "Min_y:"..tostring(self.min_y_1)..", Max_y:"..tostring(self.max_y_1),
            40, 20
        )

        love.graphics.print("Collision: "..tostring(self.status), WINDOW_WIDTH - 180, 0)
        love.graphics.print(
            "Min_x:"..tostring(self.min_x_2)..", Max_x:"..tostring(self.max_x_2),
            WINDOW_WIDTH - 180, 10
        )
        love.graphics.print(
            "Min_y:"..tostring(self.min_y_2)..", Max_y:"..tostring(self.max_y_2),
            WINDOW_WIDTH - 180, 20
        )
    end

    if self.point then
        local str_msg = "Point Collision Detected!"
        local message = love.graphics.newText(
            self.font, str_msg
        )
        love.graphics.print(
            str_msg,
            self.font,
            (WINDOW_WIDTH - message:getWidth())/2,
            10
        )
        local x_position = self.min_x_1 == self.max_x_2 and self.min_x_1 or self.max_x_1
        local y_position = self.min_y_1 == self.max_y_2 and self.min_y_1 or self.max_y_1
        love.graphics.setPointSize(8)
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.points(
            x_position,
            y_position
        )
    end
end


return Collision
