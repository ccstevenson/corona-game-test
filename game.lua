-- get the dimensions of the screen
local width = display.contentWidth
local height = display.contentHeight

-- imports
local physics = require("physics")
local storyboard = require("storyboard")

-- create a new scene
local scene = storyboard.newScene()

-- start the physics engine
physics.start()

function scene:enterScene( event )

	local group = self.view

	-- draw the ball and attach dynamically to the physics engine
	local ball = display.newCircle(100, 100, 70)
	ball:setFillColor(0.5)
	ball.isVisible = true
	physics.addBody(ball, "dynamic", { density=0.1, friction=0.1, bounce=0.4})

	-- draw two platforms for the ball to sit on and attach it statically to the physics engine
	local platformOne = display.newRect()

	-- draw invisible borders to prevent the ball from going out of bounds (attach statically to physics engine)
	-- left border
	-- right border
	-- top border
	-- bottom border

	local function resetlinearVelocity( event )
		local thisX, thisY = ball:getLinearVelocity()
		if thisY == 0 then
			thisY = -(thisY+2)
		end
		if thisX == 0 then
			thisX = -(thisX+2)
		end
		ball:setLinearVelocity(thisX, thisY)
	end

	local function onCollision( event )
		timer.performWithDelay(0, resetlinearVelocity)
	end

	local function uTiltFunc( event )
		physics.setGravity(10*event.xGravity, -10*event.yGravity)
	end

	-- attach the ball to a "collision" listener using the function onCollision
	-- attach the RunTime to an "accelerometer" listener that gets activated whenever the accelerometer is active
end

scene:addEventListener("enterScene", scene)
return scene