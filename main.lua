---@diagnostic disable: lowercase-global
local Rectangle = require "Rectangle"
local Grid = require "Grid"
local Collision = require "Collision"

WINDOW_WIDTH, WINDOW_HEIGHT = 640, 640

love.window.setMode(
    WINDOW_WIDTH,
    WINDOW_HEIGHT,
    {
        resizable=false,
        vsync=true
    }
)

function love.keypressed(key)
    if key == "q" then
        love.event.quit()
    end
end

function love.load()
    rectangle_blue = Rectangle(
        40, 40,
        140, 140,
        {0, 0, 1, 1}
    )
    rectangle_green = Rectangle(
        WINDOW_WIDTH - 180, WINDOW_HEIGHT - 180,
        140, 140,
        {0, 1, 0, 1}
    )
    grid = Grid(
        2, 30, 20,
        {1, 1, 1, 0.4}
    )
    collision = Collision(
        rectangle_blue,
        rectangle_green,
        true
    )
end


function love.update(dt)
    collision:update()
    rectangle_blue:update(1)
    rectangle_green:update(2)
end


function love.draw()
    grid:render()
    collision:render()
    rectangle_blue:render()
    rectangle_green:render()
end
