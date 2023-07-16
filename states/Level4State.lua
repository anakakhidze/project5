Level4State = Class{__includes = BaseState}

function Level4State:init()
end

function Level4State:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('level5')
	end
end


function Level4State:render()
	love.graphics.printf(
		'level 4',
		0,
		20,
		VIRTUAL_WIDTH,
		'center')
	

end

