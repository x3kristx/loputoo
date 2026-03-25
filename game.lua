local M = {}

local state = "idle"
local weapons = {"Sword and Shield", "Bow", "Grimoire", "Playing Cards"}
local selIndex = 1
local selectedWeapon = nil

function M.enter()
    selIndex = 1
    selectedWeapon = nil
    state = "select_weapon"
end

function M.leave()
    state = "idle"
    selectedWeapon = nil
end

function M.draw()
    love.graphics.setFont(love.graphics.getFont())
    love.graphics.setColor(1, 1, 1, 1)

    if state == "select_weapon" then
        love.graphics.print("Choose your weapon (Up/Down, Return to confirm, ESC to cancel):", 50, 50)
        for i, w in ipairs(weapons) do
            local y = 100 + (i - 1) * 32
            if i == selIndex then
                love.graphics.setColor(1, 1, 0, 1)
            else
                love.graphics.setColor(1, 1, 1, 1)
            end
            love.graphics.print(w, 80, y)
        end
        love.graphics.setColor(1, 1, 1, 1)

    elseif state == "playing" then
        love.graphics.print(("Starting with %s\nPress ESC to return to menu."):format(selectedWeapon), 100, 100)
    else
        love.graphics.print("Game idle (call game.enter() to start).", 100, 100)
    end
end

function M.update(dt) end

function M.keypressed(key)
    if key == "escape" then
        return "back"
    end

    if state == "select_weapon" then
        if key == "down" then
            selIndex = selIndex % #weapons + 1
        elseif key == "up" then
            selIndex = (selIndex - 2) % #weapons + 1
        elseif key == "return" or key == "z" or key == "x" then
            selectedWeapon = weapons[selIndex]
            state = "playing"
        end
        return
    end

    if state == "playing" then
        -- add gameplay logic here later
        return
    end
end

return M