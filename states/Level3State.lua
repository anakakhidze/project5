Level3State = Class{__includes = BaseState}

function Level3State:init()
end

function Level3State:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('level4')
	end
end


function Level3State:render()
	love.graphics.printf(
		'level 3',
		0,
		20,
		VIRTUAL_WIDTH,
		'center')
	

end

