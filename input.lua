local input={} -- allows you to import module

-- this code includes only movement, 
-- it does not include any other button presses
-- couldn't find anything on the internet for setting controller support up
-- with Love2d, and docs didn't explain it super well

-- use for movement across x and y axis
-- but also includes button/key to exit game

--------------------------------------------------------------------------------
--                             KEYBOARD CONTROLS                              --
--------------------------------------------------------------------------------
function input.keyboard(player,dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end
    if love.keyboard.isDown('left','a') then
        if player.x>0 then -- binds player to map
            player.x=player.x-(player.speed*dt)
        end
    elseif love.keyboard.isDown('right','d') then
        if player.x<(love.graphics.getWidth()-player.img:getWidth()) then
            player.x=player.x+(player.speed*dt)
        end
    end
    if love.keyboard.isDown('up','w','space') then
        if player.y>0 then
            player.y=player.y-(player.speed*dt)
        end
    elseif love.keyboard.isDown('s','down') then
        if player.y<(love.graphics.getHeight()-player.img:getHeight()) then
            player.y=player.y+(player.speed*dt)
        end
    end
end

--------------------------------------------------------------------------------
--                             CONTROLLER SUPPORT                             --
--------------------------------------------------------------------------------
-- tested with a ps4 controller via bluetooth
-- dpad
function input.gamepad(player,dt)
    if controller:isGamepadDown('back') then
        love.event.push('quit')
    end
    if controller:isGamepadDown('dpleft') then
        if player.x>0 then
            player.x=player.x-(player.speed*dt)
        end
    elseif controller:isGamepadDown('dpright') then
        if player.x<(love.graphics.getWidth()-player.img:getWidth()) then
            player.x=player.x+(player.speed*dt)
        end
    end
    if controller:isGamepadDown('dpup') then
        if player.y>0 then
            player.y=player.y-(player.speed*dt)
        end
    elseif controller:isGamepadDown('dpdown') then
        if player.y<(love.graphics.getHeight()-player.img:getHeight()) then
            player.y=player.y+(player.speed*dt)
        end
    end
    -- joystick
    ly=controller:getGamepadAxis('lefty')
    lx=controller:getGamepadAxis('leftx')
    if lx>0.1 then
        if player.x<(love.graphics.getWidth()-player.img:getWidth()) then
            player.x=player.x+(player.speed*dt)
        end
    elseif lx<-0.1 then
        if player.x>0 then
            player.x=player.x-(player.speed*dt)
        end
    end

    if ly>0.1 then
        if player.y<(love.graphics.getHeight()-player.img:getHeight()) then
            player.y=player.y+(player.speed*dt)
        end
    elseif ly<-0.1 then
        if player.y>0 then
            player.y=player.y-(player.speed*dt)
        end
    end
end

return input