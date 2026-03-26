local monsters = {}
local items = require("itemlist")
local weapons = require("weaponlist")

monsters.imp = {
    name = "Imp",
    health = 20,
    damage = function()
        return math.random(3, 7)
    end,
    skills = { name = "Spark", damage = function() return math.random(2, 4) end },
    drops = {
        { item = "Gold", min = 1, max = 5, chance = 1 }, -- common currency drop
        { item = items.lifestone, chance = 0.5 },          -- common item drop (object from itemlist)
        { item = weapons.grimoire, chance = 0.1 },     -- rare weapon drop (object from weaponlist)
    }
}

monsters.goblin = {
    name = "Goblin",
    health = 30,
    damage = function()
        return math.random(5, 10)
    end,
    skills = { name = "Slash", damage = function() return math.random(3, 6) end },
    drops = {
        { item = "Gold", min = 2, max = 8, chance = 1 }, -- common currency drop
        { item = items.lifestone, chance = 0.5 }
        { item = weapons.knife, chance = 0.3 }, -- rare weapon drop (object from weaponlist)
    }
}

monsters.knight = {
    name = "Knight",
    health = 50,
    damage = function()
        return math.random(8, 15)
    end,
    skills = { name = "Heavy Slash", damage = function() return math.random(10, 20) end },
    drops = {
        { item = "Gold", min = 5, max = 15, chance = 1 }, -- common currency drop
        { item = items.potion, chance = 0.3 },          -- uncommon item drop (object from itemlist)
        { item = weapons.greatsword, chance = 0.1 }, -- rare weapon drop (object from weaponlist)
    }
}