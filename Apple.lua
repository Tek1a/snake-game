Apple = Class{}

math.randomseed(os.time())

function Apple:init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	
end

function Apple:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

