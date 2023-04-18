input = require "input"
require "entities/player"

function love.load()
    player.img = love.graphics.newImage('images/player.png')
    local joysticks = love.joystick.getJoysticks()
    for i, joystick in ipairs(joysticks) do
        love.graphics.print(joystick:getName(), 10, i*20)
        controller = joystick
        break
    end
end

function love.update(dt)
    input.keyboard(player, dt)
    if joysticks then
        input.gamepad(player, dt, controller)
    end
end

function love.draw()
    love.graphics.draw(player.img, player.x, player.y)
end