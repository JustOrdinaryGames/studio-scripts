-- // Made by JustOrdinaryGames \\ -- 

wait(1)

local songs = {}
local song = nil
local skip = Instance.new("BoolValue", script)
skip.Name = "Skip"
skip.Changed:Connect(function()
	if skip.Value and song ~= nil then
		skip.Value = false
		song:Stop()
		print("Skipped!")
	end
end)

for i,v in pairs(script:GetChildren()) do
	if v:IsA("Sound") then
		v.RollOffMode = "Linear"
		v.Looped = false
		table.insert(songs, v)
	end
end

function LoadSong()
	if song ~= nil then
		local songs2 = {}
		for i,v in pairs(songs) do
			if v ~= song then table.insert(songs2, v) end
		end
		song = songs2[math.random(#songs2)]
	else
		song = songs[math.random(#songs)]
	end
	song:Play()
	repeat wait() until song.Playing == false
end

while wait() do
	LoadSong()
end