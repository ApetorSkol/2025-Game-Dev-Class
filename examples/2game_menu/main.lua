require("src.states.start_menu.start_menu")

io.stdout:setvbuf('no') -- write output immediately

function love.load()
    menu_init()
end

function love.update(dt)
    menu_update(dt)
end

function love.draw()
    menu_draw()
end
