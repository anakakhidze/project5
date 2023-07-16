Level2State = Class{__includes = BaseState}

function Level2State:init()
end

function Level2State:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('level3')
	end
end


function Level2State:render()
	love.graphics.printf(
		'level 2',
		0,
		20,
		VIRTUAL_WIDTH,
		'center')
	

end

