push = require 'push'
Class = require 'class'

require 'StateMachine'

require 'states/BaseState'
require 'states/StartState'
require 'states/PlayState'
require 'states/Level2State'
require 'states/Level3State'
require 'states/Level4State'
require 'states/Level5State'
require 'states/WinState'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgroundScroll = 0
local LOOPING_POINT = 200
local BACKGROUND_SCROLL_SPEED = 30

function love.load()
       

	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle('State Machine')
	
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true
	})
	
	stateMachine =  StateMachine {
		['start'] = function() return StartState() end,
		['play']= function() return PlayState() end,
                ['level2']= function() return Level2State() end,
                ['level3']= function() return Level3State() end,
                ['level4']= function() return Level4State() end,
                ['level5']= function() return Level5State() end,
                ['win']= function() return WinState() end
	}
	
	stateMachine:change('start')
	
	font = love.graphics.newFont('font.ttf', 16)
	love.graphics.setFont(font)

        love.keyboard.keysPressed = {}

end

function love.update(dt)
       backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % LOOPING_POINT
	stateMachine:update(dt)
        love.keyboard.keysPressed = {}
end


function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
	
	if key == 'escape' then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end



function love.resize(width, height)
	push:resize(width, height)
end


function love.draw()
	push:start()
	
        love.graphics.draw(background,-backgroundScroll,0)

	stateMachine:render()
	
	push:finish()
end
