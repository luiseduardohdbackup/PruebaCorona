-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local backgroung = display.newImage("bg.png");

local city1 = display.newImage("city1.png");
city1:setReferencePoint(display.BottomLeftReferencePoint);
city1.x = 0;
city1.y = 320;
city1.speed = 1;

local city2 = display.newImage("city1.png");
city2:setReferencePoint(display.BottomLeftReferencePoint);
city2.x = 480;
city2.y = 320;
city2.speed = 1;

local city3 = display.newImage("city2.png");
city3:setReferencePoint(display.BottomLeftReferencePoint);
city3.x = 0;
city3.y = 320;
city3.speed = 2;

local city4 = display.newImage("city2.png");
city4:setReferencePoint(display.BottomLeftReferencePoint);
city4.x = 480;
city4.y = 320;
city4.speed = 2;

function scrollCity(self, event)
	if self.x < -477 then
		self.x = 480;
	else
		self.x = self.x - self.speed;
	end
end

city1.enterFrame = scrollCity;
Runtime:addEventListener("enterFrame", city1);

city2.enterFrame = scrollCity;
Runtime:addEventListener("enterFrame", city2);

city3.enterFrame = scrollCity;
Runtime:addEventListener("enterFrame", city3);

city4.enterFrame = scrollCity;
Runtime:addEventListener("enterFrame", city4);