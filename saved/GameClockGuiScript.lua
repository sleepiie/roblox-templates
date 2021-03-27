-- Waits for parent.child to exist, then returns it
local function WaitForChild(parent, childName)
	assert(parent, "ERROR: WaitForChild: parent is nil")
	while not parent:FindFirstChild(childName) do parent.ChildAdded:wait() end
	return parent[childName]
end

-----------------
--| Variables |--
-----------------

local Gui = script.Parent
local Frame = WaitForChild(Gui, 'TimeFrame')
local Time = WaitForChild(Frame, 'Time')

local MainScript = Workspace:FindFirstChild('GameClock')
local TimeObject = WaitForChild(MainScript, 'Time')

--------------------
--| Script Logic |--
--------------------

-- Whenever TimeObject changes, update the Time displayed
TimeObject.Changed:connect(function(newValue)
	local currentTime = math.max(0, newValue)
	local hours = math.floor(currentTime / 3600)
	local minutes = math.floor(currentTime / 60) % 60
	local seconds = math.floor(currentTime) % 60
	Time.Text = string.format("%02d:%02d:%02d", hours, minutes, seconds) -- (Looks like 00:00:00)
end)
