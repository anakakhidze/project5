WinState = Class{__includes = BaseState}

function WinState:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('start')
	end
end


function WinState:render()
love.graphics.newFont('font.ttf', 10)
	love.graphics.printf(
		'win state!',
		0,
		120,
		VIRTUAL_WIDTH,
		'center')
end      
      
