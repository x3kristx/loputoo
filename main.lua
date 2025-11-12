function love.load()
    gradientShader = love.graphics.newShader[[
        extern vec4 colorTop;
        extern vec4 colorBottom;
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
        {
            float t = texture_coords.y;
            vec4 gradient = mix(colorTop, colorBottom, t);
            vec4 texColor = Texel(texture, texture_coords);
            return texColor * gradient;
        }
    ]]
    backgroundImage = love.graphics.newImage("assets/pardik.jpg")
end

local menu = {"New Game", "Settings", "Close Game"}
local menuChoice = 1
local currentScreen = "title"
local menuRects = {}

local game = require("game")

function love.keypressed(key)
    if key == "escape" and currentScreen == "settings" then
        currentScreen = "title"
        return
    end

    if currentScreen == "game" and game.keypressed then
        return game.keypressed(key)
    end

    if currentScreen == "title" then
        if key == "down" then
            menuChoice = menuChoice % #menu + 1
        elseif key == "up" then
            menuChoice = (menuChoice - 2) % #menu + 1
        elseif key == "z" or key == "x" or key == "return" then
            if menu[menuChoice] == "New Game" then
                currentScreen = "game"
                if game.enter then game.enter() end
            elseif menu[menuChoice] == "Settings" then
                currentScreen = "settings"
            elseif menu[menuChoice] == "Close Game" then
                love.event.quit()
            end
        end
    end
end
        if key == "escape" then
            currentScreen = "title"
        end

local function computeMenuRects()
    local font = mediumFont
    local startY = love.graphics.getHeight() / 2 + 100
    menuRects = {}
    for i, item in ipairs(menu) do
        local x = love.graphics.getWidth() / 2 - font:getWidth(item) / 2
        local y = startY + (i - 1) * 40
        menuRects[i] = { x = x, y = y, w = font:getWidth(item), h = font:getHeight() }
    end
end

function love.resize(w, h)
    computeMenuRects()
end

function love.load()
    bigFont = love.graphics.newFont("assets/Jersey25-regular.ttf", 48)
    mediumFont = love.graphics.newFont("assets/Jersey25-regular.ttf", 32)
    smallFont = love.graphics.newFont("assets/Jersey25-regular.ttf", 16)

    gradientShader = love.graphics.newShader[[
        extern vec4 colorTop;
        extern vec4 colorBottom;
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
        {
            float t = texture_coords.y;
            vec4 gradient = mix(colorTop, colorBottom, t);
            vec4 texColor = Texel(texture, texture_coords);
            return texColor * gradient;
        }
    ]]
    backgroundImage = love.graphics.newImage("assets/pardik.jpg")
    computeMenuRects()
end

local function drawMenu()
    local font = mediumFont
    love.graphics.setFont(font)
    computeMenuRects() -- keep rects synced with current font/size
    for i, item in ipairs(menu) do
        local color = (i == menuChoice) and {1, 1, 0, 1} or {1, 1, 1, 1}
        love.graphics.setColor(color)
        local r = menuRects[i]
        love.graphics.print(item, r.x, r.y)
    end
    love.graphics.setColor(1, 1, 1, 1)
end

function love.draw()
    if currentScreen == "game" then
        game.draw()
    else
        local windowWidth = love.graphics.getWidth()
        local windowHeight = love.graphics.getHeight()

        local imgWidth = backgroundImage:getWidth()
        local imgHeight = backgroundImage:getHeight()
        local scaleX = windowWidth / imgWidth
        local scaleY = windowHeight / imgHeight
        love.graphics.draw(backgroundImage, 0, 0, 0, scaleX, scaleY)

        if currentScreen == "title" then
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

            drawMenu()
        elseif currentScreen == "settings" then
            love.graphics.setFont(bigFont)
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print("Settings\nPress ESC to return to the menu.", windowWidth / 2 - 200, windowHeight / 2) --Add changable keys here--
        end
    end
end

function love.mousepressed(mx, my, button)
function love.update(dt)
    if currentScreen == "title" then
        local mx, my = love.mouse.getPosition()
        for i, r in ipairs(menuRects) do
            if mx >= r.x and mx <= r.x + r.w and my >= r.y and my <= r.y + r.h then
                menuChoice = i
                break
            end
        end
    end
    if button ~= 1 then return end
    if currentScreen ~= "title" then return end
    computeMenuRects()
    for i, r in ipairs(menuRects) do
        if mx >= r.x and mx <= r.x + r.w and my >= r.y and my <= r.y + r.h then
            menuChoice = i
            if menu[i] == "New Game" then
                currentScreen = "game"
                if game.enter then game.enter() end
            elseif menu[i] == "Settings" then
                currentScreen = "settings"
            elseif menu[i] == "Close Game" then
                love.event.quit()
            end
                break
            end
        end
    end
end
