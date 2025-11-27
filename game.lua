local M = {}
local classes = require("classes")

local state = "idle"
local classList = {}
local selIndex = 1
local selectedClass = nil

function M.enter()
    classList = classes.getAvailable()
    selIndex = 1
    selectedClass = nil
    state = "select"
end

function M.leave()
    state = "idle"
    selectedClass = nil
end

function M.draw()
    love.graphics.setFont(love.graphics.getFont())
    love.graphics.setColor(1, 1, 1, 1)

    if state == "select" then
        love.graphics.print("Choose your class (Up/Down, Return to confirm, ESC to cancel):", 50, 50)
        for i, c in ipairs(classList) do
            local y = 100 + (i - 1) * 32
            if i == selIndex then
                love.graphics.setColor(1, 1, 0, 1)
            else
                love.graphics.setColor(1, 1, 1, 1)
            end
            love.graphics.print(("%s - %s"):format(c.name, c.desc), 80, y)
        end
        love.graphics.setColor(1, 1, 1, 1)

    elseif state == "playing" then
        local name = selectedClass and selectedClass.name or "Unknown"
        love.graphics.print(("Playing as %s\nPress ESC to return to menu.\n(Use M.beatGame() from code to mark as beaten and unlock Joker)"):format(name), 100, 100)
    else
        love.graphics.print("Game idle (call game.enter() to start).", 100, 100)
    end
end

function M.update(dt) end

function M.keypressed(key)
    if key == "escape" then
        return "back"
    end

    if state == "select" then
        if key == "down" then
            selIndex = selIndex % #classList + 1
        elseif key == "up" then
            selIndex = (selIndex - 2) % #classList + 1
        elseif key == "return" or key == "z" or key == "x" then
            selectedClass = classList[selIndex]
            state = "playing"
            -- initialize class-specific state here if needed
        end
        return
    end

    if state == "playing" then
        -- forward gameplay keys here, or return special tokens
        -- (keep simple: no special handling)
        return
    end
end

-- call this when the player beats the game to unlock Joker for future runs
function M.beatGame()
    classes.unlockJoker()
end

return M