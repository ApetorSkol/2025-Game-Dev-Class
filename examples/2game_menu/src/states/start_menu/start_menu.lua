--[[
    Module for defining start menu
]]--


require(".src.states.start_menu.menu_graphics")
require(".src.states.start_menu.menu_controllers")


-- Function initializes menu. This shoud be called within love.load() function
function menu_init()
    -- Setup window name
    love.window.setTitle("Game Mensu")

    -- Define Menu state
    menu = {
        items = {"Play", "Options", "Credits", "Quit"},
        selected = 1,
        animation = 0,
        particles = {}
    }

    -- Define Colors
    colors = {
        bg = {0.1, 0.1, 0.15},
        primary = {0.3, 0.7, 1.0},
        hover = {0.5, 0.9, 1.0},
        text = {0.9, 0.9, 0.95}
    }

    -- Create floating particles for decoration
    for i = 1, 30 do
        table.insert(menu.particles, {
            x = math.random(0, love.graphics.getWidth()),
            y = math.random(0, love.graphics.getHeight()),
            speed = math.random(10, 30),
            size = math.random(2, 4)
        })
    end
end


--[[
    Updating menu variables. This should be called within the love.update() function
]]--
function menu_update(dt)
    -- Update animation which will be used later in draw part
    menu.animation = menu.animation + dt * 2

    -- Update particles which serve as an animation in background
    for _, p in ipairs(menu.particles) do
        p.y = p.y + p.speed * dt
        if p.y > love.graphics.getHeight() then
            p.y = -10
            p.x = math.random(0, love.graphics.getWidth())
        end
    end
end


--[[
    Drawing menu graphics. This should be called within the love.update() function
]]--
function menu_draw()
    menu_draw_graphics()
end


--[[
    Menu logic is defined in this function
]]--
function handleMenuSelection()
    local item = menu.items[menu.selected]

    if item == "Play" then
        print("Starting game...")
    elseif item == "Options" then
        print("Opening options...")
    elseif item == "Credits" then
        print("Showing credits...")
    elseif item == "Quit" then
        love.event.quit()
    end
end
