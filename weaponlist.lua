local weapon = {}

weapon.playingcards = {
    name = "Playing Cards",
    damage = function()
        local dmg = math.random(1, 13)
        print("You throw a card that dealt: " .. dmg)
        return dmg
    end,
    skills = {
        { name = "Card Storm", damage = function() return math.random(5, 20) end },
        { name = "Card Shield", block = function() print("You block the attack with a card!") end },
    }
}

weapon.swordnshield = {
    name = "Sword and Shield",
    damage = function()
        return math.random(5, 10)
    end,
    block = function(incomingDamage)
        local reduced = math.floor(incomingDamage * 0.5)
        print("You block with your shield! Incoming damage reduced from " .. incomingDamage .. " to " .. reduced)
        return reduced
    end,
    skills = {
        { name = "Double Slash", damage = function() return math.random(10, 20) end },
        { name = "Aegis", block = function() print ("You raise your shield and block the attack!") end },
    }
}

weapon.bow = {
    name = "Bow",
    damage = function()
        return math.random(3, 8)
    end,
    skills = {
        { name = "Power Shot", damage = function() return math.random(8, 15) end },
        { name = "Evasive Roll", evasion = function() print("You roll to evade the attack!") end },
    }
}