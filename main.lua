io.stdout:setvbuf('no') -- write output immediately

-- This function is used for initial logic. It is called once, when the game begins
function love.load()
    pos_x = 400
    pos_y = 300
    dir = 1
    radius = 20
    speed = 300
end

-- this is called for every frame
-- dt is time difference which defines how much time has passed since last frame
function love.update(dt)
    local move_v = 0
    local move_h = 0

    if love.keyboard.isDown("w") then move_v = -1 end
    if love.keyboard.isDown("s") then move_v = 1 end

    if love.keyboard.isDown("a") then move_h = -1 end
    if love.keyboard.isDown("d") then move_h = 1 end

    pos_x = pos_x + move_h * speed * dt -- dt is put here just because when game is lagged and player is pressing something, we still want player to move
    pos_y = pos_y + move_v * speed * dt
end

-- this is called for every frame, however it draws graphic elements instead
function love.draw()
    love.graphics.circle("fill", pos_x, pos_y, radius)
end