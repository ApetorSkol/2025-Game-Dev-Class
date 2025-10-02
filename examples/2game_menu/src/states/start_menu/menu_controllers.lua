--[[
    Defining navigating menu
]]--
function love.keypressed(key)
    if key == "up" or key == "w" then
        menu.selected = menu.selected - 1
        if menu.selected < 1 then
            menu.selected = #menu.items
        end
    elseif key == "down" or key == "s" then
        menu.selected = menu.selected + 1
        if menu.selected > #menu.items then
            menu.selected = 1
        end
    elseif key == "return" or key == "space" then
        handleMenuSelection()
    elseif key == "escape" then
        love.event.quit()
    end
end