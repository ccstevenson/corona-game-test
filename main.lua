local storyboard = require("storyboard")

-- draw the play button using playbutton.png
local playButton = display.newImage("playbutton.png", 0, 0, true)
playButton.x = 160
playButton.y = 100

local function listenerEvent( event ) -- called when the play button is touched
	--NO TOUCHY
	local t = event.target
	local phase = event.phase
	------------------------

	if "began" == phase then
		-- code that goes in here is called when the "touch" event begins
		playButton:removeSelf()
		storyboard.gotoScene("game") -- go the "gameScene" which is the actual game portion
	end
end

-- attach the playbutton to the "touch" listener
playButton:addEventListener("touch", listenerEvent)