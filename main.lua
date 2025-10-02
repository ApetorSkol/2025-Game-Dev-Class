io.stdout:setvbuf('no')

-- This function is used for initial logic. It is called once, when the game begins
function love.load()
    circle_x = 400
    circle_y = 300
    dir = 1
    radius = 20
    speed = 300
end

-- this is called for every frame
-- dt is time difference which defines how much time has passed since last frame
function love.update(dt)
    circle_x = circle_x + speed * dir * dt
end

-- this is called for every frame, however it draws graphic elements instead
function love.draw()
    love.graphics.circle("fill", circle_x, circle_y, radius)
end