local M = {}

function M.enter()
end

function M.draw()
    love.graphics.setFont(love.graphics.getFont())
    love.graphics.setColor(1,1,1,1)
    love.graphics.print("LET THE REVELS BEGIN\nPress ESC to return to the menu.", 100, 100)
end

function M.update(dt) end
function M.keypressed(key) end
function M.mousepressed(x,y,button) end

return M