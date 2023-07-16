Level5State = Class{__includes = BaseState}

function Level5State:init()
end

function Level5State:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('win')
	end
end


function Level5State:render()
	love.graphics.printf(
		'level 5',
		0,
		20,
		VIRTUAL_WIDTH,
		'center')
	

end

