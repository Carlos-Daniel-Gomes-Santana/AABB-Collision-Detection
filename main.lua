---@diagnostic disable: lowercase-global
local Rectangle = require "Square"
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
        0, 0,
        140, 140,
        {0, 0, 1, 1}
    )
    rectangle_green = Rectangle(
        WINDOW_WIDTH - 100, WINDOW_HEIGHT - 100,
        140, 140,
        {0, 1, 0, 1}
    )
    grid = Grid(
        0, 32, 20,
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