local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = game.Players.LocalPlayer
local playerGui = localPlayer.PlayerGui

local working = false
local totalKills = localPlayer.leaderstats["Total Kills"]
local ftotalKills = 0
local madedKills = 0
local selectedChar = ""

_G.workChars = {"Bald", "Cyborg", "Hunter", "Ninja"}
_G.activated = true -- false to disable
_G.killDummy = true -- false to disable
_G.clearKillstreak = true -- false to disable
_G.safeSelf = true -- false to disable
_G.safeProp = 15
_G.chargeUp = false 
_G.killing = false


local function onCharAdded(char)
	char:WaitForChild("Humanoid"):GetPropertyChangedSignal("Health"):Connect(function()
		if not char:FindFirstChild("HumanoidRootPart") then return end
		if math.floor(char.Humanoid.Health) > 15 then return end
		if _G.safeSelf == true and localPlayer.Character.Humanoid.Health <= _G.safeProp then return end
		if _G.clearKillstreak == true and madedKills == 9 then localPlayer.Character.Humanoid.Health = 0; madedKills = 0; return end
		if _G.killing == true then return end
		if _G.chargeUp == true then return end
		if working == false then return end

		if selectedChar ~= "" or selectedChar ~= nil then
			if selectedChar == "Cyborg" then
				if not playerGui.Hotbar.Backpack.Hotbar["4"].Base:FindFirstChild("Cooldown") then
					_G.killing = true
					print(madedKills)
					ftotalKills = totalKills.Value

					coroutine.wrap(function()
						local s = tick()
						while tick() - s < 1.65 do
							if not localPlayer.Character then warn("to") break end
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(cf.Position.X, cf.Position.Y, cf.Position.Z + 65) + char.Humanoid.MoveDirection * char.Humanoid.WalkSpeed * 1.25, Vector3.new(char.HumanoidRootPart.Position.X, localPlayer.Character.HumanoidRootPart.Position.Y, char.HumanoidRootPart.Position.Z))
							task.wait()
						end
					end)()

					task.wait(0.25)
					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild("Jet Dive")
					})

					task.wait(4)
					if totalKills.Value ~= ftotalKills then
						madedKills += (totalKills / 2)
						print(madedKills)
					end

					_G.killing = false
				elseif not playerGui.Hotbar.Backpack.Hotbar["3"].Base:FindFirstChild("Cooldown") then
					_G.chargeUp = true
					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild("Blitz Shot")
					})
					task.wait(2.5)
					_G.chargeUp = false
					_G.killing = true

					coroutine.wrap(function()
						repeat
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(cf.Position + Vector3.new(30, 30, 0), cf.Position + char.Humanoid.MoveDirection * char.Humanoid.WalkSpeed * 1.25)
							task.wait()
						until _G.killing == false
					end)()

					task.wait(1.25)
					_G.killing = false
				elseif not playerGui.Hotbar.Backpack.Hotbar["2"].Base:FindFirstChild("Cooldown") then
					_G.chargeUp = true
					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild("Ignition Burst")
					})
					task.wait(1)
					_G.chargeUp = false
					_G.killing = true

					coroutine.wrap(function()
						repeat
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 7) + char.Humanoid.MoveDirection
							task.wait()
						until _G.killing == false
					end)()

					task.wait(1.25)
					_G.killing = false
				end

			elseif selectedChar == "Hunter" then
				if not playerGui.Hotbar.Backpack.Hotbar["1"].Base:FindFirstChild("Cooldown") then
					_G.killing = true

					coroutine.wrap(function()
						repeat
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 3.5) + char.Humanoid.MoveDirection
							task.wait()
						until _G.killing == false
					end)()

					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild("Flowing Water")
					})

					task.wait(2)
					_G.killing = false

				elseif not playerGui.Hotbar.Backpack.Hotbar["2"].Base:FindFirstChild("Cooldown") then
					_G.killing = true

					coroutine.wrap(function()
						repeat
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 3.5) + char.Humanoid.MoveDirection
							task.wait()
						until _G.killing == false
					end)()

					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild("Lethal Whirlwind Stream")
					})

					task.wait(2)
					_G.killing = false

				elseif not playerGui.Hotbar.Backpack.Hotbar["3"].Base:FindFirstChild("Cooldown") then
					_G.killing = true

					coroutine.wrap(function()
						repeat
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 1) + char.Humanoid.MoveDirection
							task.wait()
						until _G.killing == false
					end)()

					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild([[Hunster's Grasp]])
					})

					task.wait(2)
					_G.killing = false

				end

			elseif selectedChar == "Ninja" then
				if not playerGui.Hotbar.Backpack.Hotbar["1"].Base:FindFirstChild("Cooldown") then
					_G.chargeUp = true
					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild("Flash Strike")
					})
					task.wait(0.1)
					_G.chargeUp = false
					_G.killing = true

					coroutine.wrap(function()
						repeat
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 8) + char.Humanoid.MoveDirection
							task.wait()
						until _G.killing == false
					end)()

					task.wait(1)
					_G.killing = false

				elseif not playerGui.Hotbar.Backpack.Hotbar["2"].Base:FindFirstChild("Cooldown") then
					if char.Humanoid.Health > 12 then
						_G.chargeUp = true
						localPlayer.Character.Communicate:FireServer({
							["Goal"] = "Console Move",
							["Tool"] = localPlayer.Backpack:WaitForChild("Whirlwind Kick")
						})
						task.wait(0.4)
						_G.chargeUp = false
						_G.killing = true

						coroutine.wrap(function()
							repeat
								local cf = char.HumanoidRootPart.CFrame
								localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 1) + char.Humanoid.MoveDirection
								task.wait()
							until _G.killing == false
						end)()

						task.wait(1.5)
						_G.killing = false
					end

				elseif not playerGui.Hotbar.Backpack.Hotbar["4"].Base:FindFirstChild("Cooldown") then
					_G.killing = true

					coroutine.wrap(function()
						repeat
							local cf = char.HumanoidRootPart.CFrame
							localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 7) + char.Humanoid.MoveDirection
							task.wait()
						until _G.killing == false
					end)()

					localPlayer.Character.Communicate:FireServer({
						["Goal"] = "Console Move",
						["Tool"] = localPlayer.Backpack:WaitForChild("Explosive Shuriken")
					})

					task.wait(2)
					_G.killing = false

				else
					warn("CD")
				end

			elseif not playerGui.Hotbar.Backpack.Hotbar["3"].Base:FindFirstChild("Cooldown") then
				_G.killing = true

				coroutine.wrap(function()
					repeat
						local cf = char.HumanoidRootPart.CFrame
						localPlayer.Character.HumanoidRootPart.CFrame = cf - (cf.LookVector * 0) + char.Humanoid.MoveDirection
						task.wait()
					until _G.killing == false
				end)()

				localPlayer.Character.Communicate:FireServer({
					["Goal"] = "Console Move",
					["Tool"] = localPlayer.Backpack:WaitForChild("Scatter")
				})

				task.wait(4)
				_G.killing = false

			else
				warn(selectedChar)
			end
		end
	end)
end

RunService.Heartbeat:Connect(function()
	if localPlayer.Character then
		local has = false
		for i, v in pairs(_G.workChars) do
			if localPlayer.Character:GetAttribute("Character") == v then
				selectedChar = v
				has = true
			end
		end
		if not has or has == false then
			working = false
			warn(localPlayer.Character:GetAttribute("Character"))
		else
			working = true
		end

		if _G.activated == false then
			working = false
		end

		if _G.activated == true and working == true and _G.killing == false and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
			localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 200, 0)
		end
	end
end)

local function onPlrAdded(plr)
	plr.CharacterAdded:Connect(onCharAdded)
	if plr.Character then
		onCharAdded(plr.Character)
	end
end

for _, plr in Players:GetPlayers() do
	if plr ~= localPlayer then
		onPlrAdded(plr)
	end
end
Players.PlayerAdded:Connect(onPlrAdded)