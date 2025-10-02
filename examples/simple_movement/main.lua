--[[
    Main module of whole game. It has 3 functions defined
    - love.load() for initial setup
    - love.update(dt) for updating internal state of game every frame
    - love.draw() for drawing graphical objects
]]--


require("movement") -- import modules with movement logic
require("controller") -- import controller

io.stdout:setvbuf('no') -- write output immediately

-- This function is used for initial logic. It is called once, when the game begins
function love.load()
    pos_x = 400
    pos_y = 300
    dir = 1
    radius = 20
    speed = 300
    width, height = love.graphics.getDimensions()
end

-- this is called for every frame
-- dt is time difference which defines how much time has passed since last frame
function love.update(dt)
    movement(dt)
    overflow()
end


-- this is called for every frame, however it draws graphic elements instead
function love.draw()
    love.graphics.circle("fill", pos_x, pos_y, radius)
end
