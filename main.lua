function love.load()
    bigFont = love.graphics.newFont(48)
    mediumFont = love.graphics.newFont(32)
    smallFont = love.graphics.newFont(16)
end
function love.draw()
    local text = "Title Screen"
    local font = bigFont
    love.graphics.setFont(font)
    local textWidth = font:getWidth(text)
    local textHeight = font:getHeight()

    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    love.graphics.print(text,
        (windowWidth - textWidth) / 2, 
        (windowHeight - textHeight) / 2
    )
end