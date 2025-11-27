local M = {}
local saveFile = "save.dat"

local classes = {
    { id = "warrior", name = "Warrior", desc = "You will start out with a claymore.", weapons = { "sword" }, unlocked = true },
    { id = "ranger",  name = "Ranger",  desc = "You will start out with a bow.",       weapons = { "bow", "gun" }, unlocked = true },
     { id = "mage",  name = "Mage",  desc = "You will start out with a grimoire.",       weapons = { "grimoire" }, unlocked = true },
    { id = "joker",   name = "Joker",   desc = "You will start out with a deck of playing cards.",      weapons = { "playingcards" }, unlocked = false },
}

local function loadSave()
    if love and love.filesystem and love.filesystem.getInfo(saveFile) then
        local s = love.filesystem.read(saveFile) or ""
        if s:match("beaten=1") then
            classes[3].unlocked = true
        end
    end
end

function M.getAll()
    loadSave()
    local out = {}
    for i, c in ipairs(classes) do out[i] = c end
    return out
end

function M.getAvailable()
    loadSave()
    local out = {}
    for _, c in ipairs(classes) do
        if c.unlocked then out[#out + 1] = c end
    end
    return out
end

function M.getById(id)
    for _, c in ipairs(classes) do if c.id == id then return c end end
    return nil
end

function M.unlockJoker()
    classes[3].unlocked = true
    if love and love.filesystem then
        love.filesystem.write(saveFile, "beaten=1")
    end
end

function M.isUnlocked(id)
    local c = M.getById(id)
    return c and c.unlocked
end

return M