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

	local backgroung = display.newImage("bg.png");
	screenGroup:insert(backgroung);

	city1 = display.newImage("city1.png");
	city1:setReferencePoint(display.BottomLeftReferencePoint);
	city1.x = 0;
	city1.y = 320;
	city1.speed = 1;
	screenGroup:insert(city1);

	city2 = display.newImage("city1.png");
	city2:setReferencePoint(display.BottomLeftReferencePoint);
	city2.x = 480;
	city2.y = 320;
	city2.speed = 1;
	screenGroup:insert(city2);

	city3 = display.newImage("city2.png");
	city3:setReferencePoint(display.BottomLeftReferencePoint);
	city3.x = 0;
	city3.y = 320;
	city3.speed = 2;
	screenGroup:insert(city3);

	city4 = display.newImage("city2.png");
	city4:setReferencePoint(display.BottomLeftReferencePoint);
	city4.x = 480;
	city4.y = 320;
	city4.speed = 2;
	screenGroup:insert(city4);

	jet = display.newImage("redJet.png");
	jet.x = 100;
	jet.y = 100;
	physics.addBody(jet, "dynamic", {density=.1, bounce=0.1, friction=.2, radius=12});
	screenGroup:insert(jet);
end

function scrollCity(self, event)
	if self.x < -477 then
		self.x = 480;
	else
		self.x = self.x - self.speed;
	end
end

function activateJets(self, event)
	self:applyForce(0, -1, self.x, self.y);
end

function touchScreen(event)
	if event.phase == "began" then
		jet.enterFrame = activateJets;
		Runtime:addEventListener("enterFrame", jet);
	end

	if event.phase == "ended" then
		Runtime:removeEventListener("enterFrame", jet);
	end
end

function scene:enterScene(event)
	city1.enterFrame = scrollCity;
	Runtime:addEventListener("enterFrame", city1);

	city2.enterFrame = scrollCity;
	Runtime:addEventListener("enterFrame", city2);

	city3.enterFrame = scrollCity;
	Runtime:addEventListener("enterFrame", city3);

	city4.enterFrame = scrollCity;
	Runtime:addEventListener("enterFrame", city4);

	Runtime:addEventListener("touch", touchScreen);
end

function scene:exitScene(event)

end

function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene);
scene:addEventListener("enterScene", scene);
scene:addEventListener("exitScene", scene);
scene:addEventListener("destroyScene", scene);

return scene;