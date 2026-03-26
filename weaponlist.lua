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

weapon.grimoire = {
    name = "Grimoire",
    damage = function()
        return math.random(4, 12)
    end,
    skills = {
        { name = "Fireball", damage = function() return math.random(10, 25) end },
        { name = "Arcane Shield", block = function() print("You conjure a magical shield to block the attack!") end },
    }
}

weapon.chakrams = {
    name = "Chakrams",
    damage = function()
        return math.random(2, 6)
    end,
    skills = {
        { name = "Whirling Blades", damage = function() return math.random(6, 12) end },
        { name = "Deflect", block = function() print("You deflect the attack with your chakrams!") end },
    }
}

weapon.knuckles = {
    name = "Knuckles",
    damage = function()
        return math.random(1, 4)
    end,
    skills = {
        { name = "Rapid Punches", damage = function() return math.random(4, 10) end },
        { name = "Counter Strike", block = function() print("You counter the attack with a quick punch!") end },
    }
}

weapon.halberd = {
    name = "Halberd",
    damage = function()
        return math.random(6, 12)
    end,
    skills = {
        { name = "Sweeping Strike", damage = function() return math.random(12, 20) end },
        { name = "Guard", block = function() print("You block the enemy's attack with your halberd!") end },
    }
}

weapon.greatsword = {
    name = "Greatsword",
    damage = function()
        return math.random(8, 15)
    end,
    skills = {
        { name = "Heavy Slash", damage = function() return math.random(15, 30) end },
        { name = "Parry", block = function() print("You parry the attack with your greatsword!") end },
    }
}

weapon.rapier = {
    name = "Rapier",
    damage = function()
        return math.random(3, 7)
    end,
    skills = {
        { name = "Lunge", damage = function() return math.random(7, 14) end },
        { name = "Riposte", block = function() print("You riposte the attack with your rapier!") end },
    }
}

weapon.knife = {
    name = "Knife",
    damage = function()
        return math.random(2, 5)
    end,
    skills = {
        { name = "Stab", damage = function() return math.random(5, 10) end },
        { name = "Dodge", block = function() print("You dodge the attack with your knife!") end },
    }
}       

weapon.staff = {
    name = "Staff",
    damage = function()
        return math.random(4, 10)
    end,
    skills = {
        { name = "Arcane Blast", damage = function() return math.random(8, 16) end },
        { name = "Block", block = function() print("You block the attack with your staff!") end },
    }
}
return weapon

