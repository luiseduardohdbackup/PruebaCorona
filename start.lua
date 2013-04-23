-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

-- requires

local physics = require "physics";
physics.start();

local storyboard = require "storyboard";
local scene = storyboard.newScene();

-- background

function scene:createScene(event)
	local screenGroup = self.view

	backgroung = display.newImage("start.png");
	screenGroup:insert(backgroung);

	city1 = display.newImage("city2.png");
	city1:setReferencePoint(display.BottomLeftReferencePoint);
	city1.x = 0;
	city1.y = 320;
	screenGroup:insert(city1);
end

function start(event)
	if event.phase == "began" then
		storyboard.gotoScene("game", "fade", 400);
	end
end

function scene:enterScene(event)
	backgroung:addEventListener("touch", start);
end

function scene:exitScene(event)
	backgroung:removeEventListener("touch", start);
end

function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene);
scene:addEventListener("enterScene", scene);
scene:addEventListener("exitScene", scene);
scene:addEventListener("destroyScene", scene);

return scene;