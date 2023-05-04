Snake = Class{}

function Snake:init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.dy = 0
    self.dx = 0
end


function Snake:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Snake:collides(object)
    if self.x > object.x + object.width or object.x > self.x + self.width then 
        return false 
    end
    if self.y > object.y + object.height or object.y > self.y + self.height then
        return false
    end
    return true
end