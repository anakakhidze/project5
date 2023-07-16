PlayState = Class{__includes = BaseState}

function PlayState:init()
end

function PlayState:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('level2')
	end
end



function PlayState:render()
	love.graphics.printf(
		'currently in play state',
                0,
		10,
		VIRTUAL_WIDTH,
		'center')

       love.graphics.printf(
		'Level 1',
		0,
		VIRTUAL_HEIGHT / 2 - 10,
		VIRTUAL_WIDTH,
		'center')
end

