---@diagnostic disable: lowercase-global
local Rectangle = require "Rectangle"
local Grid = require "Grid"

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
        40, 40,
        140, 140,
        {0, 0, 1, 0.5}
    )
    rectangle_green = Rectangle(
        WINDOW_WIDTH - 180, WINDOW_HEIGHT - 180,
        140, 140,
        {0, 1, 0, 0.5}
    )
    grid = Grid(
        2, 30, 20,
        {1, 1, 1, 0.3}
    )
end


function love.update(dt)
    rectangle_blue:update(1)
    rectangle_green:update(2)
end


function love.draw()
    grid:render()
    rectangle_blue:render()
    rectangle_green:render()
end