--[[
    This module defines movement of object within the game using functions
]]--


--[[
    Function defines movement of object with "w", "a", "s", "d"
]]--
function movement(dt)
    local move_v = 0
    local move_h = 0

    if love.keyboard.isDown("w") then move_v = -1 end
    if love.keyboard.isDown("s") then move_v = 1 end

    if love.keyboard.isDown("a") then move_h = -1 end
    if love.keyboard.isDown("d") then move_h = 1 end

    -- in case of movement, adjust speed to be always constant.
    -- In this case we calculate the angle by which it is moving and then calculate sin and cosine of x and y direction.
    if move_v ~= 0 or move_h ~= 0 then
        local dir = math.atan2(move_v, move_h)
        pos_x = pos_x + math.cos(dir)* speed * dt -- dt is put here just because when game is lagged and player is pressing something, we still want player to move
        pos_y = pos_y + math.sin(dir) * speed * dt
    end
end

--[[
    function defines jumping of object to other side of screen in case it touches edges
]]--
function overflow()
    if pos_x > width or 0 > pos_x then
        pos_x = width - pos_x
    end

    if pos_y > height or 0 > pos_y then
        pos_y = height - pos_y
    end
end