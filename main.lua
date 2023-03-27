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
    
end


function love.update(dt)
    
end


function love.draw()
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
end