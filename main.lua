push = require 'push'
Class = require 'class'

require 'Apple'
require 'Snake'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

speed = 120

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle("Snake game")
	
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = true,
		vsync = true
	}) 

    medium_font = love.graphics.newFont("font.ttf", 20)
	small_font = love.graphics.newFont("font.ttf", 13)

    snake = Snake (10, 30, 10, 10)
    apple = Apple (100, 100, 10, 10)
    -- 'start' (sanam tamashi daiwyeba)
    -- 'play'  (tamashi mimdinareobs)
    -- 'done'   (tamashi dasrulda)
    gameState = 'start'
end

function love.resize(w, h)
	push:resize(w, h)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	elseif key == 'enter' or key == 'return' then
		if gameState == 'start' then
			gameState = 'play'
		end
	end
end
function love.update(dt)
    if gameState == 'play' then 
        if love.keyboard.isDown('d') and (not snake:collides(apple) or not (apple.x + apple.width > snake.x))  then
            snake.x = math.min( VIRTUAL_WIDTH-40, snake.x + speed * dt ) 
        end
         if love.keyboard.isDown('a') then
            snake.x = math.max (0, snake.x - speed * dt )
        end
        if love.keyboard.isDown('w') then
            snake.y = math.max( 0, snake.y - speed * dt) 
        end

        if love.keyboard.isDown('s') then
            snake.y = math.min( VIRTUAL_HEIGHT-40, snake.y + speed * dt) 
        end

    end

end

function love.draw()
    push:apply("start")
    love.graphics.clear(62/255, 229/255, 43/255, 255/255)
    
    if gameState == 'start' then
		love.graphics.setFont(small_font)
		love.graphics.printf('Welcome to Snake game!', 0, 10, VIRTUAL_WIDTH, 'center')
		love.graphics.printf('Press Enter to begin!', 0, 25, VIRTUAL_WIDTH, 'center')
	elseif gameState == 'serve' then
		love.graphics.setFont(medium_font)
		
		love.graphics.printf('Press Enter to serve!', 0, 25, VIRTUAL_WIDTH, 'center')
	end
	


    snake:render()
    apple:render()

    push:apply("end")
end
function displaycontact()
    if ( snake:collides(apple) or not (apple.x + apple.width > snake.x)) then
        apple.x

end