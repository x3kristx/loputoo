function love.load()
    bigFont = love.graphics.newFont("assets/Jersey25-regular.ttf", 48)
    mediumFont = love.graphics.newFont("assets/Jersey25-regular.ttf", 32)
    smallFont = love.graphics.newFont"assets/Jersey25-regular.ttf", (16)

    gradientShader = love.graphics.newShader[[
        extern vec4 colorTop;
        extern vec4 colorBottom;
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
        {
            float t = texture_coords.y;
            vec4 gradient = mix(colorTop, colorBottom, t);
            vec4 texColor = Texel(texture, texture_coords); // Sample the texture
            return texColor * gradient;
        }
    ]]
    backgroundImage = love.graphics.newImage("assets/pardik.jpg")
end
function love.draw()
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    -- Draw and stretch the background image
    local imgWidth = backgroundImage:getWidth()
    local imgHeight = backgroundImage:getHeight()
    local scaleX = windowWidth / imgWidth
    local scaleY = windowHeight / imgHeight
    love.graphics.draw(backgroundImage, 0, 0, 0, scaleX, scaleY)

    -- Gradient text rendering (same as before)
    local text = "game title"
    local font = bigFont
    love.graphics.setFont(font)
    local textWidth = font:getWidth(text)
    local textHeight = font:getHeight()

    local canvas = love.graphics.newCanvas(textWidth, textHeight)
    love.graphics.setCanvas(canvas)
    love.graphics.clear(0, 0, 0, 0)
    love.graphics.setFont(font)
    love.graphics.setColor(1,1,1,1)
    love.graphics.print(text, 0, 0)
    love.graphics.setCanvas()

    gradientShader:send("colorTop", {1, 0, 0, 1})
    gradientShader:send("colorBottom", {0, 0, 1, 1})
    love.graphics.setShader(gradientShader)
    love.graphics.draw(canvas, (windowWidth - textWidth) / 2, (windowHeight - textHeight) / 2)
    love.graphics.setShader()
end