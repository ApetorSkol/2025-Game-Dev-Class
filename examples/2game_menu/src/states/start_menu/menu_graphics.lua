--[[
    This functions draws menu. It does it in several steps.
]]--
function menu_draw_graphics()
    -- Get dimensions of menu
    local w, h = love.graphics.getWidth(), love.graphics.getHeight()

    -- Draw Background
    love.graphics.setColor(colors.bg)
    love.graphics.rectangle("fill", 0, 0, w, h)

    -- Draw particles
    love.graphics.setColor(colors.primary[1], colors.primary[2], colors.primary[3], 0.3)
    for _, p in ipairs(menu.particles) do
        love.graphics.circle("fill", p.x, p.y, p.size)
    end

    -- Print Title
    love.graphics.setColor(colors.hover)
    local title = "MENU GAME OR SOME"
    local titleY = h * 0.25 + math.sin(menu.animation) * 5
    love.graphics.print(title, math.floor(w/2 - love.graphics.getFont():getWidth(title)/2), titleY)

    -- Draw Menu items
    local startY = h * 0.45
    local spacing = 60

    for i, item in ipairs(menu.items) do
        local y = startY + (i - 1) * spacing
        local x = w / 2

        -- Draw Selection indicator
        if i == menu.selected then
            love.graphics.setColor(colors.hover)
            local pulse = math.sin(menu.animation * 3) * 0.2 + 0.8
            love.graphics.setColor(colors.hover[1], colors.hover[2], colors.hover[3], pulse)

            -- Animate selection box
            local boxW = 200 + math.sin(menu.animation * 2) * 10
            love.graphics.rectangle("line", x - boxW/2, y - 5, boxW, 40, 5, 5)

            -- Animate Arrow indicators
            local arrowOffset = math.sin(menu.animation * 4) * 5
            love.graphics.print(">", x - 120 - arrowOffset, y)
            love.graphics.print("<", x + 100 + arrowOffset, y)
        else
            love.graphics.setColor(colors.text[1], colors.text[2], colors.text[3], 0.6)
        end

        -- Menu item text
        love.graphics.setColor(i == menu.selected and colors.hover or colors.text)
        love.graphics.print(item, math.floor(x - love.graphics.getFont():getWidth(item)/2), y)
    end

    -- Print Instructions
    love.graphics.setColor(colors.text[1], colors.text[2], colors.text[3], 0.5)
    local inst = "Use UP/DOWN or W/S arrows to navigate, ENTER or SPACE to select"
    love.graphics.print(inst, math.floor(w/2 - love.graphics.getFont():getWidth(inst)/2), h - 40)

end