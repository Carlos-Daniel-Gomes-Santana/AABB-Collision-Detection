---@diagnostic disable: lowercase-global
Rectangle = require "Square"
WINDOW_WIDTH, WINDOW_HEIGHT = 640, 640

love.window.setMode(
    WINDOW_WIDTH,
    WINDOW_HEIGHT,
    {
        resizable=false,
        vsync=true
    }
)

function love.load()
    rectangle_blue = Rectangle(
        0, 0,
        100, 100,
        {0, 0, 1, 1}
    )
    rectangle_green = Rectangle(
        WINDOW_WIDTH - 100, WINDOW_HEIGHT - 100,
        100, 100,
        {0, 1, 0, 1}
    )
end


function love.update(dt)
    rectangle_blue:update(1)
    rectangle_green:update(2)
end


function love.draw()
    love.graphics.setColor(1, 1, 1, 1)
    for i = 0, 32 do
        love.graphics.line(
            20*i, 0,
            20*i, WINDOW_HEIGHT
        )
        love.graphics.line(
            0, 20*i,
            WINDOW_WIDTH, 20*i
        )
    end
    rectangle_blue:render()
    rectangle_green:render()
end