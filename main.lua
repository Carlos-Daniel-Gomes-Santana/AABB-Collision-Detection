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
    Rect_blue = Rectangle(
        0, 0,
        100, 100,
        {0, 0, 1, 1}
    )
end


function love.update(dt)
    Rect_blue:update()
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
    Rect_blue:render()
end