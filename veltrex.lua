local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local image = "rbxassetid://79422104460159"

if getgenv then
	local genv = getgenv()
	if genv.__MACHO_HUB_LOADED then
		warn("[MACHO HUB] Already loaded — skipping re-execute.")
		return
	end
	genv.__MACHO_HUB_LOADED = true
elseif shared then
	if shared.__MACHO_HUB_LOADED then
		warn("[MACHO HUB] Already loaded — skipping re-execute.")
		return
	end
	shared.__MACHO_HUB_LOADED = true
end

if (function()
	local ok, result = pcall(function()
		return game:GetService("CoreGui")
	end)

	if ok and result then
		if result:FindFirstChild("MachoHub") or result:FindFirstChild("MachoMobileButtons") then
			return true
		end
	end

	local localPlayer = game:GetService("Players").LocalPlayer

	if localPlayer then
		local playerGui = localPlayer:FindFirstChild("PlayerGui")

		if playerGui then
			playerGui = playerGui:FindFirstChild("MachoHub") or playerGui:FindFirstChild("MachoMobileButtons")
		end

		if playerGui then
			return true
		end
	end

	return false
end)() then
	warn("[MACHO HUB] GUI already present — skipping re-execute.")

	if getgenv then
		getgenv().__MACHO_HUB_LOADED = true
	end

	return
end

if isfile and isfile("MachoHUB.json") then
	local ok, result = pcall(function()
		return HttpService:JSONDecode(readfile("MachoHUB.json"))
	end)

	if ok and type(result) == "table" then
		if type(result.backgroundEnabled) == "boolean" then
			backgroundEnabled = result.backgroundEnabled
		end

		if type(result.backgroundIndex) == "number" then
			backgroundIndex = math.max(1, math.floor(result.backgroundIndex))
		end

		if type(result.uiScale) == "number" and result.uiScale >= 0.4 and result.uiScale <= 2 then
			uiScaleValue = result.uiScale
		end

		if type(result.guiScale) == "number" and result.guiScale >= 0.4 and result.guiScale <= 2 then
			uiScaleValue = result.guiScale
		end
	end
end

repeat
	task.wait()
until game:IsLoaded()

pcall(function()
	for _, v in ipairs({ "VoidVS_Intro", "BerserkVS_Intro" }) do
		local CoreGui = game:GetService("CoreGui")
		CoreGui = CoreGui and CoreGui:FindFirstChild(v)

		if CoreGui then
			CoreGui:Destroy()
		end

		local playerGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")

		if playerGui then
			local v2 = playerGui:FindFirstChild(v)

			if v2 then
				v2:Destroy()
			end
		end
	end

	local SoundService = game:GetService("SoundService")
	SoundService = SoundService and SoundService:FindFirstChild("VoidVS_IntroSong")

	if SoundService then
		SoundService:Stop()
		SoundService:Destroy()
	end
end)

local text = "Night"

local tbl = {
	Off = { kind = "off" },
	Night = {
		clock = 22,
		brightness = 2,
		ambient = { 110, 100, 130 },
		outAmb = { 120, 110, 140 },
		sky = { stars = 4000, moon = 18, sun = 0, moonTex = true },
		atm = { dens = 0.45, color = { 120, 60, 180 }, decay = { 60, 20, 100 }, glare = 0.5, haze = 1.2 },
	},
	Aurora = {
		clock = 14,
		brightness = 3,
		ambient = { 150, 120, 150 },
		outAmb = { 160, 130, 150 },
		atm = { dens = 0.55, color = { 255, 80, 200 }, decay = { 255, 20, 150 }, glare = 2.5, haze = 3 },
		clouds = { cover = 0.7, dens = 0.7, color = { 255, 240, 250 } },
	},
	Sunset = {
		clock = 17.2,
		brightness = 2.5,
		ambient = { 170, 120, 100 },
		outAmb = { 180, 130, 110 },
		sky = { stars = 0, sun = 25, moon = 0 },
		atm = { dens = 0.5, color = { 255, 130, 60 }, decay = { 255, 80, 30 }, glare = 2, haze = 2.5 },
		clouds = { cover = 0.55, dens = 0.55, color = { 255, 200, 140 } },
	},
	Galaxy = {
		clock = 0,
		brightness = 1.5,
		ambient = { 70, 60, 100 },
		outAmb = { 80, 70, 110 },
		sky = { stars = 10000, moon = 30, sun = 0 },
		atm = { dens = 0.15, color = { 40, 20, 80 }, decay = { 20, 10, 50 }, glare = 0.3, haze = 0.5 },
	},
	Cyber = {
		clock = 21,
		brightness = 2.2,
		ambient = { 90, 130, 170 },
		outAmb = { 100, 140, 180 },
		sky = { stars = 2000, moon = 12 },
		atm = { dens = 0.4, color = { 0, 200, 255 }, decay = { 150, 0, 255 }, glare = 2, haze = 2 },
		clouds = { cover = 0.4, dens = 0.6, color = { 100, 200, 255 } },
	},
	Sakura = {
		clock = 11,
		brightness = 3.5,
		ambient = { 170, 150, 160 },
		outAmb = { 180, 160, 170 },
		sky = { sun = 8 },
		atm = { dens = 0.3, color = { 255, 200, 220 }, decay = { 255, 170, 200 }, glare = 1, haze = 1.5 },
		clouds = { cover = 0.6, dens = 0.4, color = { 255, 250, 252 } },
	},
	["Pink Night"] = {
		clock = 23,
		brightness = 2.2,
		ambient = { 120, 60, 110 },
		outAmb = { 140, 70, 120 },
		sky = { stars = 5000, moon = 22, sun = 0, moonTex = true },
		atm = { dens = 0.5, color = { 255, 80, 180 }, decay = { 140, 30, 100 }, glare = 0.7, haze = 1.4 },
		clouds = { cover = 0.3, dens = 0.5, color = { 180, 90, 150 } },
	},
	["Blood Moon"] = {
		clock = 22.5,
		brightness = 1.6,
		ambient = { 130, 40, 40 },
		outAmb = { 150, 50, 50 },
		sky = { stars = 1500, moon = 28, sun = 0, moonTex = true },
		atm = { dens = 0.6, color = { 220, 30, 30 }, decay = { 120, 10, 10 }, glare = 1.4, haze = 2 },
		clouds = { cover = 0.5, dens = 0.7, color = { 120, 30, 30 } },
	},
	["Emerald Dawn"] = {
		clock = 6.5,
		brightness = 2.8,
		ambient = { 130, 170, 140 },
		outAmb = { 140, 180, 150 },
		sky = { sun = 18, moon = 0, stars = 0 },
		atm = { dens = 0.4, color = { 80, 200, 140 }, decay = { 40, 150, 90 }, glare = 1.8, haze = 2.2 },
		clouds = { cover = 0.5, dens = 0.5, color = { 200, 255, 220 } },
	},
	Volcanic = {
		clock = 19,
		brightness = 2,
		ambient = { 180, 80, 40 },
		outAmb = { 200, 90, 50 },
		sky = { stars = 200, sun = 12, moon = 0 },
		atm = { dens = 0.75, color = { 255, 60, 0 }, decay = { 180, 20, 0 }, glare = 3, haze = 3.5 },
		clouds = { cover = 0.8, dens = 0.9, color = { 120, 40, 20 } },
	},
	Arctic = {
		clock = 9,
		brightness = 3.2,
		ambient = { 200, 220, 235 },
		outAmb = { 210, 230, 245 },
		sky = { sun = 10, stars = 0, moon = 0 },
		atm = {
			dens = 0.3,
			color = { 180, 220, 255 },
			decay = { 140, 200, 240 },
			glare = 1.5,
			haze = 1.8,
		},
		clouds = { cover = 0.7, dens = 0.6, color = { 250, 253, 255 } },
	},
	["Midnight Ocean"] = {
		clock = 1.5,
		brightness = 1.7,
		ambient = { 60, 90, 130 },
		outAmb = { 70, 100, 140 },
		sky = { stars = 6000, moon = 24, sun = 0, moonTex = true },
		atm = { dens = 0.5, color = { 20, 60, 140 }, decay = { 10, 30, 90 }, glare = 0.6, haze = 1.5 },
	},
	Vaporwave = {
		clock = 19.5,
		brightness = 2.4,
		ambient = { 180, 120, 200 },
		outAmb = { 190, 130, 210 },
		sky = { stars = 1000, moon = 14 },
		atm = {
			dens = 0.45,
			color = { 255, 100, 220 },
			decay = { 120, 60, 255 },
			glare = 2.2,
			haze = 2.4,
		},
		clouds = { cover = 0.5, dens = 0.55, color = { 200, 150, 255 } },
	},
	Toxic = {
		clock = 13,
		brightness = 2.5,
		ambient = { 140, 180, 80 },
		outAmb = { 150, 190, 90 },
		atm = { dens = 0.55, color = { 100, 220, 40 }, decay = { 60, 150, 20 }, glare = 1.8, haze = 2.6 },
		clouds = { cover = 0.65, dens = 0.7, color = { 180, 255, 120 } },
	},
	["Solar Eclipse"] = {
		clock = 12,
		brightness = 0.9,
		ambient = { 50, 40, 60 },
		outAmb = { 60, 50, 70 },
		sky = { stars = 3500, sun = 22, moon = 0 },
		atm = { dens = 0.5, color = { 255, 140, 40 }, decay = { 30, 20, 40 }, glare = 2.8, haze = 1.8 },
	},
	Hellscape = {
		clock = 18,
		brightness = 1.8,
		ambient = { 200, 60, 30 },
		outAmb = { 220, 70, 40 },
		sky = { stars = 100, sun = 30, moon = 0 },
		atm = { dens = 0.85, color = { 255, 30, 0 }, decay = { 120, 0, 0 }, glare = 3.5, haze = 4 },
		clouds = { cover = 0.95, dens = 0.95, color = { 80, 20, 10 } },
	},
	Heaven = {
		clock = 12,
		brightness = 4,
		ambient = { 240, 235, 210 },
		outAmb = { 250, 245, 220 },
		sky = { sun = 16, moon = 0, stars = 0 },
		atm = { dens = 0.25, color = { 255, 250, 220 }, decay = { 255, 240, 200 }, glare = 3, haze = 1.5 },
		clouds = { cover = 0.85, dens = 0.5, color = { 255, 255, 255 } },
	},
	Storm = {
		clock = 15,
		brightness = 1.4,
		ambient = { 90, 90, 110 },
		outAmb = { 100, 100, 120 },
		sky = { stars = 0, sun = 6, moon = 0 },
		atm = { dens = 0.65, color = { 80, 90, 120 }, decay = { 40, 50, 80 }, glare = 0.5, haze = 3 },
		clouds = { cover = 0.95, dens = 0.95, color = { 60, 65, 80 } },
	},
	Sunrise = {
		clock = 6.2,
		brightness = 2.8,
		ambient = { 220, 180, 130 },
		outAmb = { 230, 190, 140 },
		sky = { sun = 22, stars = 0, moon = 0 },
		atm = {
			dens = 0.45,
			color = { 255, 180, 100 },
			decay = { 255, 140, 80 },
			glare = 2.4,
			haze = 2.2,
		},
		clouds = { cover = 0.4, dens = 0.4, color = { 255, 220, 180 } },
	},
	["Deep Space"] = {
		clock = 0,
		brightness = 1,
		ambient = { 30, 25, 50 },
		outAmb = { 40, 35, 60 },
		sky = { stars = 15000, moon = 0, sun = 0 },
		atm = { dens = 0.08, color = { 15, 5, 40 }, decay = { 5, 0, 20 }, glare = 0.2, haze = 0.3 },
	},
	["Lavender Dream"] = {
		clock = 18.5,
		brightness = 2.6,
		ambient = { 180, 160, 220 },
		outAmb = { 190, 170, 230 },
		sky = { stars = 800, moon = 16, sun = 0 },
		atm = {
			dens = 0.4,
			color = { 200, 160, 255 },
			decay = { 160, 120, 220 },
			glare = 1.4,
			haze = 1.8,
		},
		clouds = { cover = 0.55, dens = 0.5, color = { 220, 200, 255 } },
	},
	Inferno = {
		clock = 17.5,
		brightness = 2.2,
		ambient = { 220, 100, 40 },
		outAmb = { 235, 110, 50 },
		sky = { sun = 26, moon = 0, stars = 0 },
		atm = { dens = 0.6, color = { 255, 90, 20 }, decay = { 200, 40, 0 }, glare = 3, haze = 3.2 },
		clouds = { cover = 0.7, dens = 0.7, color = { 200, 80, 40 } },
	},
	["Mint Sky"] = {
		clock = 10,
		brightness = 3.2,
		ambient = { 180, 230, 210 },
		outAmb = { 190, 240, 220 },
		sky = { sun = 10 },
		atm = {
			dens = 0.32,
			color = { 150, 255, 210 },
			decay = { 100, 220, 180 },
			glare = 1.6,
			haze = 1.6,
		},
		clouds = { cover = 0.55, dens = 0.45, color = { 240, 255, 250 } },
	},
}

local tbl2 = {
	"Off",
	"Night",
	"Aurora",
	"Sunset",
	"Galaxy",
	"Cyber",
	"Sakura",
	"Pink Night",
	"Blood Moon",
	"Emerald Dawn",
	"Volcanic",
	"Arctic",
	"Midnight Ocean",
	"Vaporwave",
	"Toxic",
	"Solar Eclipse",
	"Hellscape",
	"Heaven",
	"Storm",
	"Sunrise",
	"Deep Space",
	"Lavender Dream",
	"Inferno",
	"Mint Sky",
}

candyColor = function(arg)
	return Color3.fromRGB(arg[1], arg[2], arg[3])
end

CandyApplyCustomSky = function(arg)
	for _, child in ipairs(Lighting:GetChildren()) do
		if child:GetAttribute("MoveeSkyTheme") then
			pcall(function()
				child:Destroy()
			end)
		end
	end

	local terrain = workspace:FindFirstChildOfClass("Terrain")

	if terrain then
		for _, child in ipairs(terrain:GetChildren()) do
			if child:GetAttribute("MoveeSkyTheme") then
				pcall(function()
					child:Destroy()
				end)
			end
		end
	end

	local v = tbl[arg]

	if not v or v.kind == "off" then
		Lighting.ClockTime = 14
		Lighting.Brightness = 2
		Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
		Lighting.Ambient = Color3.fromRGB(127, 127, 127)
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = true
		return
	end

	Lighting.FogStart = 0
	Lighting.FogEnd = 100000
	Lighting.FogColor = Color3.fromRGB(200, 200, 200)
	Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	Lighting.GlobalShadows = true
	Lighting.ClockTime = v.clock or 14
	Lighting.Brightness = v.brightness or 2

	if v.outAmb then
		Lighting.OutdoorAmbient = candyColor(v.outAmb)
	end

	if v.ambient then
		Lighting.Ambient = candyColor(v.ambient)
	end

	if v.sky then
		local sky = Instance.new("Sky")
		sky:SetAttribute("MoveeSkyTheme", true)

		if v.sky.stars then
			sky.StarCount = v.sky.stars
		end

		if v.sky.moon then
			sky.MoonAngularSize = v.sky.moon
		end

		if v.sky.sun then
			sky.SunAngularSize = v.sky.sun
		end

		if v.sky.moonTex then
			sky.MoonTextureId = "rbxasset://sky/moon.jpg"
		end

		sky.Parent = Lighting
	end

	if v.atm then
		local atmosphere = Instance.new("Atmosphere")
		atmosphere:SetAttribute("MoveeSkyTheme", true)
		atmosphere.Density = v.atm.dens or 0.3
		atmosphere.Color = candyColor(v.atm.color)
		atmosphere.Decay = candyColor(v.atm.decay)
		atmosphere.Glare = v.atm.glare or 1
		atmosphere.Haze = v.atm.haze or 1
		atmosphere.Parent = Lighting
	end

	if v.clouds and terrain then
		local clouds = Instance.new("Clouds")
		clouds:SetAttribute("MoveeSkyTheme", true)
		clouds.Cover = v.clouds.cover or 0.5
		clouds.Density = v.clouds.dens or 0.5
		clouds.Color = candyColor(v.clouds.color)
		clouds.Parent = terrain
	end
end

local localPlayer = Players.LocalPlayer

loadCustomImageAsset = function(arg, arg2)
	if not arg or arg == "" then
		return ""
	end
	arg2 = arg2 or "void_img_" .. tostring(math.floor(tick() * 1000)) .. ".png"

	local function fn(arg3)
		for _, v in ipairs({ getcustomasset, getsynasset, getasset }) do
			if typeof(v) ~= "function" then
				continue
			end

			local ok, result = pcall(function()
				return v(arg3)
			end)

			if ok and type(result) == "string" and result ~= "" then
				return result
			end
		end

		if typeof(getcustomasset) == "function" then
			local ok, result = pcall(function()
				return getcustomasset(arg3)
			end)

			if ok and type(result) == "string" and result ~= "" then
				return result
			end
		end

		return ""
	end

	if isfile and isfile(arg2) then
		local v = fn(arg2)
		if v ~= "" then
			return v
		end
	end

	local body = nil

	pcall(function()
		local response = game:HttpGet(arg)

		if response and #response > 80 then
			body = response
		end
	end)

	if not body then
		local request_ = syn and syn.request or http and (http.request or http.Request) or request or http_request

		if request_ then
			local ok, result = pcall(function()
				return request_({ Url = arg, Method = "GET", Headers = { ["User-Agent"] = "Mozilla/5.0" } })
			end)

			if ok and type(result) == "table" then
				body = result.Body or result.body or result.Data or result.data
			elseif ok and type(result) == "string" then
				body = result
			end
		end
	end

	if not body or #body < 80 then
		return arg
	end

	pcall(function()
		if writefile then
			writefile(arg2, body)
		end
	end)

	task.wait(0.05)
	local v = fn(arg2)
	if v ~= "" then
		return v
	end
	return arg
end

local n = 59
local n2 = 9
local n3 = 30
local n4 = 15
local flag = false
local flag2 = false
local flag3 = true
local n5 = 80
local flag4 = false
local flag5 = false
local flag6 = false
local flag7 = false
local flag8 = false
local flag9 = false
local n6 = 0
local flag10 = false

local tbl3 = {
	antiKick = true,
	brainrot = false,
	tpBat = false,
	batV2 = false,
	tpConn = nil,
	v2Conn = nil,
	v2Rot = nil,
	hitCD = false,
	v2CD = false,
	setTPBatVisual = nil,
	setAntiKickVisual = nil,
	setSafeModeVisual = nil,
	startTPBat = nil,
	stopTPBat = nil,
	startBatV2 = nil,
	stopBatV2 = nil,
	toggleBatV2 = nil,
	enableAntiKick = nil,
	disableAntiKick = nil,
	findBat = nil,
	closestRoot = nil,
	tpHit = nil,
	_tpShieldConn = nil,
	_tpAntiDieConn = nil,
	_tpCharConn = nil,
	_tpPatchConn = nil,
	_tpHitDone = false,
	_tpTargetHealth = nil,
	_tpTargetHum = nil,
	_tpLockedRoot = nil,
}

local flag11 = false
local flag12 = false
local v = nil
local v2 = nil
local flag13 = false
local flag14 = false
local n7 = 56.5
local connection = nil
local n8 = 0
local flag15 = false
local n9 = 3
local n10 = -7
local tbl4 = {}
local n11 = 0

local function fn()
	return flag13 == true or flag14 == true or tbl3 and tbl3.batV2 == true
end

local function fn2()
	local character = localPlayer.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	character = character and character:FindFirstChildOfClass("Humanoid")
	if not humanoidRootPart or not character or character.Health <= 0 then
		return
	end
	local now = tick()
	if now - (n11 or 0) < 0.08 then
		return
	end
	n11 = now
	local v3, v4 = humanoidRootPart.CFrame:ToEulerAnglesYXZ()
	humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, (n10 or -7) + math.random() * 0.6 - 0.3, humanoidRootPart.Position.Z) * CFrame.Angles(0, v4, 0)
	humanoidRootPart.AssemblyLinearVelocity = Vector3.new((math.random() - 0.5) * 0.4, 0, (math.random() - 0.5) * 0.4)
end

RunService.Heartbeat:Connect(function()
	if not flag15 or not fn() then
		if next(tbl4) then
			table.clear(tbl4)
		end

		return
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= localPlayer and player.Character then
			local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				local y = humanoidRootPart.Position.Y
				local flag16 = tbl4[player.UserId]

				if flag16 then
					flag16 = flag16 - y >= 3
				end

				if flag16 then
					pcall(fn2)
					table.clear(tbl4)
					return
				end

				tbl4[player.UserId] = y
			end
		end
	end
end)

local tbl5 = {
	WHITE = Color3.fromRGB(255, 255, 255),
	PURPLE = Color3.fromRGB(207, 159, 255),
	BLUE = Color3.fromRGB(58, 128, 245),
	RED = Color3.fromRGB(232, 52, 68),
	PINK = Color3.fromRGB(255, 105, 180),
	YELLOW = Color3.fromRGB(255, 214, 0),
	GREY = Color3.fromRGB(90, 90, 90),
	FOREST = Color3.fromRGB(46, 139, 87),
	GREEN = Color3.fromRGB(0, 255, 120),
	NEON = Color3.fromRGB(50, 255, 140),
	RAINBOW = Color3.fromRGB(255, 0, 0),
}

RAINBOW_CUR = Color3.fromRGB(255, 0, 0)
local str = "GREEN"

local function fn3()
	if str == "RAINBOW" then
		return RAINBOW_CUR
	end
	return tbl5[str] or tbl5.WHITE
end

_G.__isRainbow = function()
	return str == "RAINBOW"
end

PULSE = PULSE or { fns = {} }

PULSE.add = function(arg)
	table.insert(PULSE.fns, arg)
end

PULSE.mix = function(arg, arg2, arg3)
	return Color3.new(arg.R + (arg2.R - arg.R) * arg3, arg.G + (arg2.G - arg.G) * arg3, arg.B + (arg2.B - arg.B) * arg3)
end

task.spawn(function()
	while true do
		local n12 = (math.sin(os.clock() * 1.7) + 1) * 0.5

		for i = #PULSE.fns, 1, -1 do
			local ok, result = pcall(PULSE.fns[i], n12)

			if not ok or result == false then
				table.remove(PULSE.fns, i)
			end
		end

		task.wait(0.05)
	end
end)

task.spawn(function()
	local n12 = 0

	while true do
		task.wait(0.07)

		if str == "RAINBOW" then
			n12 = (n12 + 0.005) % 1
			local n13 = 0.88 + 0.12 * math.sin(os.clock() * 1.6)
			local clamp = math.clamp
			RAINBOW_CUR = Color3.fromHSV(n12, math.clamp(0.78 + 0.18 * math.sin(os.clock() * 0.9), 0, 1), clamp(n13, 0, 1))

			pcall(function()
				if applyVoidTheme then
					applyVoidTheme()
				end
			end)
		end
	end
end)

local function fn4(arg, arg2, arg3)
	local n12 = math.clamp(arg3 or 0.5, 0, 1)
	return Color3.new(arg.R + (arg2.R - arg.R) * n12, arg.G + (arg2.G - arg.G) * n12, arg.B + (arg2.B - arg.B) * n12)
end

local function fn5()
	local v3 = fn3()

	pcall(function()
		if C then
			local color = Color3.fromRGB(8, 8, 10)
			local color2 = Color3.fromRGB(4, 4, 6)
			C.blue = v3
			C.blueDim = fn4(v3, Color3.fromRGB(30, 30, 30), 0.45)
			C.blueDark = fn4(color2, v3, 0.18)
			C.bg = fn4(color, v3, 0.08)
			C.bgDark = fn4(color2, v3, 0.06)
			C.row = fn4(Color3.fromRGB(14, 14, 18), v3, 0.12)
			C.input = fn4(Color3.fromRGB(14, 14, 18), v3, 0.1)
			C.divider = fn4(Color3.fromRGB(40, 40, 48), v3, 0.35)
			C.text = Color3.fromRGB(255, 255, 255)
			C.textDim = fn4(Color3.fromRGB(170, 170, 180), v3, 0.3)
			C.textMuted = fn4(Color3.fromRGB(110, 110, 120), v3, 0.25)
			C.white = Color3.fromRGB(255, 255, 255)

			if C.green then
				C.green = v3
			end
		end

		local function fn6(arg)
			if not arg then
				return false
			end
			local n12 = arg.R * 255
			local n13 = arg.G * 255
			local n14 = arg.B * 255
			local n15 = math.max(n12, n13, n14) - math.min(n12, n13, n14)
			local n16 = (n12 + n13 + n14) / 3
			if n13 > 90 and n13 >= n12 * 1.15 and n13 >= n14 * 1.15 and n15 > 20 then
				return true
			end

			if n15 > 40 and n16 > 35 and n16 < 250 then
				return true
			end
			return false
		end

		local function fn7(arg)
			if not arg then
				return
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				if not descendant:GetAttribute("ThemeSwatch") then
					if descendant:IsA("UIStroke") then
						local name = descendant.Parent and descendant.Parent.Name or ""
						local attribute = descendant:GetAttribute("_baseColor")

						if not attribute then
							attribute = descendant.Color
							descendant:SetAttribute("_baseColor", attribute)
						end

						if name == "LogoCircle" or name == "TabHighlight" or name == "MachoOpenPill" or name == "MiniBtn" then
							descendant.Color = v3
						elseif fn6(attribute) then
							descendant.Color = v3
						else
							descendant.Color = fn4(attribute, v3, 0.55)
						end
					elseif descendant:IsA("Frame") or descendant:IsA("TextButton") or descendant:IsA("ImageButton") then
						local attribute = descendant:GetAttribute("_baseBG")

						if not attribute then
							attribute = descendant.BackgroundColor3
							descendant:SetAttribute("_baseBG", attribute)
						end

						if attribute and fn6(attribute) then
							descendant.BackgroundColor3 = v3
						elseif attribute then
							local n12 = attribute.R * 255
							local n13 = attribute.G * 255
							local n14 = attribute.B * 255
							local n15 = (n12 + n13 + n14) / 3

							if math.max(n12, n13, n14) - math.min(n12, n13, n14) < 45 and n15 < 95 then
								descendant.BackgroundColor3 = fn4(Color3.fromRGB(n12, n13, n14), v3, 0.22)
							else
								descendant.BackgroundColor3 = attribute
							end
						end

						if descendant:IsA("TextButton") then
							local attribute2 = descendant:GetAttribute("_baseText")

							if not attribute2 then
								attribute2 = descendant.TextColor3
								descendant:SetAttribute("_baseText", attribute2)
							end

							descendant.TextColor3 = fn6(attribute2) and v3 or attribute2
						end
					elseif descendant:IsA("TextLabel") then
						local attribute = descendant:GetAttribute("_baseText")

						if not attribute then
							local textColor3 = descendant.TextColor3
							descendant:SetAttribute("_baseText", textColor3)
							attribute = textColor3
						end

						descendant.TextColor3 = fn6(attribute) and v3 or attribute
					end
				end

				if descendant.Name == "MachoTitle" and (descendant:IsA("ImageLabel") or descendant:IsA("ImageButton")) then
					descendant.ImageColor3 = fn4(Color3.fromRGB(255, 255, 255), v3, 0.4)
				elseif descendant.Name == "LogoCircle" and (descendant:IsA("ImageLabel") or descendant:IsA("ImageButton")) then
					descendant.ImageColor3 = Color3.fromRGB(255, 255, 255)
				elseif descendant:IsA("ImageLabel") and descendant.Name == "BtnImage" then
					descendant.ImageColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
		end

		if GuiRefs then
			if GuiRefs.outer then
				fn7(GuiRefs.outer)
			end

			if GuiRefs.inner then
				GuiRefs.inner.BackgroundColor3 = C and C.bg or Color3.fromRGB(8, 8, 10)
				local uiStroke = GuiRefs.inner:FindFirstChildOfClass("UIStroke")

				if uiStroke then
					uiStroke.Color = v3
				end

				fn7(GuiRefs.inner)
			end

			if GuiRefs.hub then
				fn7(GuiRefs.hub)
			end

			if GuiRefs.categoryList then
				fn7(GuiRefs.categoryList)
			end

			if GuiRefs.contentFrame then
				fn7(GuiRefs.contentFrame)
			end

			if GuiRefs.bgGrad then
				GuiRefs.bgGrad.BackgroundColor3 = C and C.bgDark or Color3.fromRGB(4, 4, 6)
			end

			if GuiRefs.machoTitle then
				if GuiRefs.machoTitle:IsA("ImageLabel") or GuiRefs.machoTitle:IsA("ImageButton") then
					GuiRefs.machoTitle.ImageColor3 = fn4(Color3.fromRGB(255, 255, 255), v3, 0.4)
				end
			end

			if CategoryRefs and CategoryRefs.btnsSide then
				for k, v4 in pairs(CategoryRefs.btnsSide) do
					local flag16 = k == CategoryRefs.active
					local row = C and C.row or Color3.fromRGB(16, 19, 21)
					v4.BackgroundColor3 = flag16 and fn4(row, v3, 0.14) or row
					v4.BackgroundTransparency = flag16 and 0 or 0.22
					v4.TextColor3 = flag16 and Color3.fromRGB(255, 255, 255) or C and C.textDim or Color3.fromRGB(150, 165, 158)
					local indicators = CategoryRefs.indicators and CategoryRefs.indicators[k]

					if indicators then
						indicators.bar.BackgroundColor3 = v3

						if indicators.glow then
							indicators.glow.ImageColor3 = v3
						end
					end
				end
			end

			if CategoryRefs and CategoryRefs.tabHL then
				CategoryRefs.tabHL.BackgroundColor3 = v3
				local uiStroke = CategoryRefs.tabHL:FindFirstChildOfClass("UIStroke")

				if uiStroke then
					uiStroke.Color = v3
				end
			end

			if GuiRefs and GuiRefs.contentFrame then
				GuiRefs.contentFrame.ScrollBarImageColor3 = v3
			end

			if MOB_BTN_THEME then
				for _, v4 in ipairs(MOB_BTN_THEME) do
					pcall(v4)
				end
			end

			if WATERMARK_REFRESH then
				pcall(WATERMARK_REFRESH, v3)
			end

			if GuiRefs.inner then
				for _, child in ipairs(GuiRefs.inner:GetChildren()) do
					if child:IsA("Frame") and child.Size.X.Offset <= 2 and child.Size.X.Scale == 0 then
						if not fn6(child.BackgroundColor3) then
						end

						child.BackgroundColor3 = v3
					end
				end
			end
		end

		if mobGuiRef then
			for _, descendant in ipairs(mobGuiRef:GetDescendants()) do
				if descendant:IsA("UIStroke") then
					descendant.Color = v3
				end
			end
		end

		if stealBarFrame then
			for _, descendant in ipairs(stealBarFrame:GetDescendants()) do
				if descendant:IsA("UIStroke") then
					descendant.Color = v3
				end
			end

			local uiStroke = stealBarFrame:FindFirstChildOfClass("UIStroke")

			if uiStroke then
				uiStroke.Color = v3
			end
		end
	end)
end

local flag16 = false
local flag17 = false
local flag18 = true
local flag19 = false
local n12 = 0.3
_alSwingDebounce = false
_arSwingDebounce = false
autoBatSetVisual = nil
resetAutoBatMotion = nil
setBatCounterVisual = nil
startBatCounter = nil
stopBatCounter = nil
local flag20 = false
removeAccessoriesEnabled = false
antiLagDescConn = nil
local flag21 = false
stretchRezConn = nil
setStretchRezVisual = nil
unwalkSavedAnimate = nil
_anyKeyListening = false
local flag22 = false
autoTPHeight = 20
autoTPConn = nil
setAutoTPVisual = nil
local flag23 = false
local flag24 = true
local flag25 = false
local visible = true
logoCircleRef = nil
local n13 = 80
MachotextEnabled = false
local flag26 = false
stealBarFrame = nil
local n14 = 2
local n15 = 1
uiScaleValue = 1

local tbl6 = {
	carrySpeed = nil,
	lagger = nil,
	laggerCarry = nil,
	laggerNormal = nil,
	autoLeft = nil,
	autoRight = nil,
	autoBat = nil,
	tpBat = nil,
	batV2 = nil,
}

mobGuiRef = nil
local fieldOfView = 80
local n16 = 1
laggerModePillRef = nil
carryModePillRef = nil
local flag27 = false
local flag28 = false
local text2 = "OFF"
local flag29 = false
local flag30 = false
local meshId = "rbxassetid://1095708"
local meshId2 = "rbxassetid://101851696"
local textureId = "rbxassetid://101851254"
local color = Color3.fromRGB(64, 64, 64)

local function fn6(arg)
	local face = arg:FindFirstChild("face")

	if face then
		face:Destroy()
	end
end

applyHeadlessToChar = function(arg, arg2)
	if not arg then
		return
	end
	local head = arg:FindFirstChild("Head")
	if not head then
		return
	end

	if arg2 then
		head.Transparency = 1
		head.CanCollide = false
		fn6(head)

		for _, child in ipairs(head:GetChildren()) do
			if child:IsA("SpecialMesh") and (child.Name == "HeadlessMesh" or child.MeshId == meshId) then
				child:Destroy()
			end
		end

		local specialMesh = Instance.new("SpecialMesh")
		specialMesh.MeshType = Enum.MeshType.FileMesh
		specialMesh.MeshId = meshId
		specialMesh.Scale = Vector3.new(0.001, 0.001, 0.001)
		specialMesh.Name = "HeadlessMesh"
		specialMesh.Parent = head

		head:GetPropertyChangedSignal("Transparency"):Connect(function()
			if head.Transparency ~= 1 then
				head.Transparency = 1
			end
		end)

		head.ChildAdded:Connect(function(child)
			if child.Name == "face" and child:IsA("Decal") then
				child:Destroy()
			end
		end)
	else
		head.Transparency = 0
		head.CanCollide = true

		for _, child in ipairs(head:GetChildren()) do
			if child:IsA("SpecialMesh") and child.Name == "HeadlessMesh" then
				child:Destroy()
			end
		end
	end
end

applyKorbloxToChar = function(parent, arg)
	if not parent then
		return
	end
	local humanoid = parent:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return
	end

	if arg then
		if humanoid.RigType == Enum.HumanoidRigType.R6 then
			local rightLeg = parent:FindFirstChild("Right Leg")

			if rightLeg then
				for _, child in ipairs(rightLeg:GetChildren()) do
					if child:IsA("SpecialMesh") and child.Name == "KorbloxMesh" then
						child:Destroy()
					end
				end

				local specialMesh = Instance.new("SpecialMesh")
				specialMesh.MeshType = Enum.MeshType.FileMesh
				specialMesh.MeshId = meshId2
				specialMesh.TextureId = textureId
				specialMesh.Scale = Vector3.one
				specialMesh.Name = "KorbloxMesh"
				specialMesh.Parent = rightLeg
				rightLeg.Color = color
			end
		elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
			local rightUpperLeg = parent:FindFirstChild("RightUpperLeg")

			if rightUpperLeg then
				rightUpperLeg.Transparency = 1
				local rightLowerLeg = parent:FindFirstChild("RightLowerLeg")
				local rightFoot = parent:FindFirstChild("RightFoot")

				if rightLowerLeg then
					rightLowerLeg.Transparency = 1
				end

				if rightFoot then
					rightFoot.Transparency = 1
				end

				local korbloxLeg = parent:FindFirstChild("KorbloxLeg")

				if korbloxLeg then
					korbloxLeg:Destroy()
				end

				local part = Instance.new("Part")
				part.Name = "KorbloxLeg"
				part.Size = Vector3.new(1, 2, 1)
				part.Anchored = false
				part.CanCollide = false
				part.Color = color
				part.Parent = parent
				local specialMesh = Instance.new("SpecialMesh")
				specialMesh.MeshType = Enum.MeshType.FileMesh
				specialMesh.MeshId = meshId2
				specialMesh.TextureId = textureId
				specialMesh.Scale = Vector3.one
				specialMesh.Name = "KorbloxMesh"
				specialMesh.Parent = part
				local weld = Instance.new("Weld")
				weld.Part0 = rightUpperLeg
				weld.Part1 = part
				weld.C0 = CFrame.new(0, -0.8, 0)
				weld.Name = "KorbloxWeld"
				weld.Parent = part
			end
		end
	elseif humanoid.RigType == Enum.HumanoidRigType.R6 then
		local rightLeg = parent:FindFirstChild("Right Leg")

		if rightLeg then
			for _, child in ipairs(rightLeg:GetChildren()) do
				if child:IsA("SpecialMesh") and child.Name == "KorbloxMesh" then
					child:Destroy()
				end
			end

			rightLeg.Color = Color3.fromRGB(255, 255, 255)
		end
	elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
		local rightUpperLeg = parent:FindFirstChild("RightUpperLeg")

		if rightUpperLeg then
			rightUpperLeg.Transparency = 0
			local rightLowerLeg = parent:FindFirstChild("RightLowerLeg")
			local rightFoot = parent:FindFirstChild("RightFoot")

			if rightLowerLeg then
				rightLowerLeg.Transparency = 0
			end

			if rightFoot then
				rightFoot.Transparency = 0
			end

			local korbloxLeg = parent:FindFirstChild("KorbloxLeg")

			if korbloxLeg then
				korbloxLeg:Destroy()
			end
		end
	end
end

applyCharterToChar = function(arg)
	if not arg then
		return
	end
	applyHeadlessToChar(arg, flag29)
	applyKorbloxToChar(arg, flag30)
end

local tbl7 = {
	"OFF",
	"Adidas Sports",
	"Adidas Community",
	"Adidas Aura",
	"Wicked Popular",
	"Elder",
	"Zombie",
	"Mage",
	"Catwalk Glam",
	"Astronaut",
}

local tbl8 = {
	["Adidas Sports"] = {
		WalkAnim = 18537392113,
		RunAnim = 18537384940,
		JumpAnim = 18537380791,
		FallAnim = 18537367238,
		ClimbAnim = 18537363391,
		Animation1 = 18537376492,
		Animation2 = 18537371272,
	},
	["Adidas Community"] = {
		WalkAnim = 122150855457006,
		RunAnim = 82598234841035,
		JumpAnim = 75290611992385,
		FallAnim = 98600215928904,
		ClimbAnim = 88763136693023,
		Animation1 = 122257458498464,
		Animation2 = 102357151005774,
	},
	["Adidas Aura"] = {
		WalkAnim = 83842218823011,
		RunAnim = 118320322718866,
		JumpAnim = 109996626521204,
		FallAnim = 95603166884636,
		ClimbAnim = 97824616490448,
		Animation1 = 110211186840347,
		Animation2 = 114191137265065,
	},
	["Wicked Popular"] = {
		WalkAnim = 92072849924640,
		RunAnim = 72301599441680,
		JumpAnim = 104325245285198,
		FallAnim = 121152442762481,
		ClimbAnim = 131326830509784,
		Animation1 = 118832222982049,
		Animation2 = 76049494037641,
	},
	Elder = {
		WalkAnim = 10921111375,
		RunAnim = 10921104374,
		JumpAnim = 10921107367,
		FallAnim = 10921105765,
		ClimbAnim = 10921100400,
		Animation1 = 10921101664,
		Animation2 = 10921102574,
	},
	Zombie = {
		WalkAnim = 10921355261,
		RunAnim = 616163682,
		JumpAnim = 10921351278,
		FallAnim = 10921350320,
		ClimbAnim = 10921343576,
		Animation1 = 10921344533,
		Animation2 = 10921345304,
	},
	Mage = {
		WalkAnim = 10921152678,
		RunAnim = 10921148209,
		JumpAnim = 10921149743,
		FallAnim = 10921148939,
		ClimbAnim = 10921143404,
		Animation1 = 10921144709,
		Animation2 = 10921145797,
	},
	["Catwalk Glam"] = {
		WalkAnim = 109168724482748,
		RunAnim = 81024476153754,
		JumpAnim = 116936326516985,
		FallAnim = 92294537340807,
		ClimbAnim = 119377220967554,
		Animation1 = 133806214992291,
		Animation2 = 94970088341563,
	},
	Astronaut = {
		WalkAnim = 10921046031,
		RunAnim = 10921039308,
		JumpAnim = 10921042494,
		FallAnim = 10921040576,
		ClimbAnim = 10921032124,
		Animation1 = 10921034824,
		Animation2 = 10921036806,
	},
}

_animOriginalIds = {}
local flag31 = true
activeBatBillboard = nil
activeMedusaBillboard = nil
local flag32 = true
persistentRagdollGui = nil
local flag33 = false
local str2 = "manual"
holdInfJumpConn = nil
DROP_ASCEND_DURATION = 0.2
DROP_ASCEND_SPEED = 150
_GuiKeys = nil
local flag34 = false
local flag35 = true
local tbl9 = { folder = nil, conns = {}, labels = {} }
local flag36 = true
local n17 = 1
bgImageRef = nil

GuiRefs = GuiRefs or {
	hub = nil,
	outer = nil,
	outerScale = nil,
	inner = nil,
	headerFrame = nil,
	backgroundImage = nil,
	bgGrad = nil,
	categoryList = nil,
	contentFrame = nil,
	chromeGroup = nil,
	machoTitle = nil,
	logoCircle = nil,
	hideGui = nil,
	showGui = nil,
	refreshCanvas = nil,
}

local tbl10 = {}
local tbl11 = { url = image, file = "macho_bg_tiger.png", name = "Tiger", tint = Color3.fromRGB(255, 255, 255) }

local tbl12 = {
	url = "https://files.catbox.moe/pk5a3v.jpeg",
	file = "void_bg_1.jpeg",
	name = "Background 1",
	tint = Color3.fromRGB(255, 255, 255),
}

local tbl13 = {
	url = "https://files.catbox.moe/v8y0ak.png",
	file = "void_bg_2.png",
	name = "Background 2",
	tint = Color3.fromRGB(255, 255, 255),
}

local tbl14 = {
	url = "https://files.catbox.moe/sl73hb.png",
	file = "void_bg_3.png",
	name = "Background 3",
	tint = Color3.fromRGB(255, 255, 255),
}

local tbl15 = {
	url = "https://files.catbox.moe/ptt187.png",
	file = "void_bg_4.png",
	name = "Background 4",
	tint = Color3.fromRGB(255, 255, 255),
}

local tbl16 = {
	url = "rbxassetid://88369503310562",
	file = "aura_bg_5.png",
	name = "Background 5",
	tint = Color3.fromRGB(255, 255, 255),
}

local tbl17 = {
	url = "rbxassetid://77514425260751",
	file = "macho_bg_a.png",
	name = "Background 6",
	tint = Color3.fromRGB(255, 255, 255),
}

local tbl18 = {
	url = "rbxassetid://112899995372259",
	file = "macho_bg_b.png",
	name = "Background 7",
	tint = Color3.fromRGB(255, 255, 255),
}

local tbl19 = {
	url = "rbxassetid://104775518072608",
	file = "macho_bg_c.png",
	name = "Background 8",
	tint = Color3.fromRGB(255, 255, 255),
}

tbl10[1] = tbl11
tbl10[2] = tbl12
tbl10[3] = tbl13
tbl10[4] = tbl14
tbl10[5] = tbl15
tbl10[6] = tbl16
tbl10[7] = tbl17
tbl10[8] = tbl18
tbl10[9] = tbl19
local tbl20 = {}

local function fn7(arg)
	for _, v3 in ipairs({ getcustomasset, getsynasset, getasset }) do
		if typeof(v3) ~= "function" then
			continue
		end

		local ok, result = pcall(function()
			return v3(arg)
		end)

		if ok and type(result) == "string" and result ~= "" then
			return result
		end
	end

	if typeof(getcustomasset) == "function" then
		local ok, result = pcall(function()
			return getcustomasset(arg)
		end)

		if ok and type(result) == "string" and result ~= "" then
			return result
		end
	end

	return ""
end

local function fn8(arg)
	if not arg then
		return ""
	end

	if arg.url and (string.find(arg.url, "rbxassetid://") or string.find(arg.url, "rbxasset://")) then
		return arg.url
	end

	if isfile and isfile(arg.file) then
		local v3 = fn7(arg.file)
		if v3 ~= "" then
			return v3
		end
	end

	local body = nil

	local ok, result = pcall(function()
		return game:HttpGet(arg.url)
	end)

	if ok and result and #result > 100 then
		body = result
	end

	if not body then
		local request_ = http and http.request or request or syn and syn.request

		if request_ then
			local v3 = request_({ Url = arg.url, Method = "GET" })

			if v3 and v3.Body and #v3.Body > 100 then
				body = v3.Body
			end
		end
	end

	if not body then
		return ""
	end

	pcall(function()
		writefile(arg.file, body)
	end)

	task.wait(0.05)
	return fn7(arg.file)
end

for i, v3 in ipairs(tbl10) do
	if v3.url and (string.find(v3.url, "rbxassetid://") or string.find(v3.url, "rbxasset://")) then
		tbl20[i] = v3.url
	else
		task.spawn(function()
			local v4 = fn8(v3)
			tbl20[i] = v4 ~= "" and v4 or v3.url
		end)
	end
end

applyBackgroundImage = function(arg)
	n17 = arg or 0
	if not bgImageRef then
		return
	end

	if n17 == 0 or n17 == nil then
		n17 = 1
	end

	local v3 = tbl10[n17]
	local url = tbl20[n17]

	if not url or url == "" then
		if v3 then
			url = fn8(v3)

			if (not url or url == "") and v3.url then
				url = v3.url
			end

			tbl20[n17] = url
		end
	end

	if (not url or url == "") and v3 and v3.url then
		url = v3.url
	end

	if url and url ~= "" then
		bgImageRef.Image = url
		bgImageRef.ImageTransparency = 0.12
		local tint = v3 and v3.tint or Color3.fromRGB(255, 255, 255)
		bgImageRef.ImageColor3 = tint
		bgImageRef.ScaleType = Enum.ScaleType.Crop
		bgImageRef.Visible = true
		bgImageRef.ZIndex = 1
		flag36 = true

		if GuiRefs and GuiRefs.bgGrad then
			GuiRefs.bgGrad.BackgroundTransparency = 0.72
			GuiRefs.bgGrad.ZIndex = 0
		end

		if GuiRefs and GuiRefs.inner then
			GuiRefs.inner.BackgroundTransparency = 0.15
		end

		if MOB_BTN_ICONS then
			for _, v4 in ipairs(MOB_BTN_ICONS) do
				pcall(function()
					if v4 and v4.Parent then
						v4.Image = url
						v4.ImageColor3 = tint
					end
				end)
			end
		end
	else
		if GuiRefs and GuiRefs.bgGrad then
			GuiRefs.bgGrad.BackgroundTransparency = 0
		end

		if GuiRefs and GuiRefs.inner then
			GuiRefs.inner.BackgroundTransparency = 0
		end
	end
end

espClear = function()
	for _, conn in pairs(tbl9.conns) do
		pcall(function()
			conn:Disconnect()
		end)
	end

	tbl9.conns = {}

	for _, label in pairs(tbl9.labels) do
		pcall(function()
			if label.billboard then
				label.billboard:Destroy()
			end
		end)

		pcall(function()
			if label.avatarBillboard then
				label.avatarBillboard:Destroy()
			end
		end)

		pcall(function()
			if label.highlight then
				label.highlight:Destroy()
			end
		end)

		pcall(function()
			if label.line then
				label.line:Destroy()
			end
		end)
	end

	tbl9.labels = {}

	if tbl9.folder then
		pcall(function()
			tbl9.folder:Destroy()
		end)

		tbl9.folder = nil
	end
end

espRemovePlayer = function(arg)
	if not tbl9.labels[arg] then
		return
	end

	pcall(function()
		if tbl9.labels[arg].billboard then
			tbl9.labels[arg].billboard:Destroy()
		end
	end)

	pcall(function()
		if tbl9.labels[arg].avatarBillboard then
			tbl9.labels[arg].avatarBillboard:Destroy()
		end
	end)

	pcall(function()
		if tbl9.labels[arg].highlight then
			tbl9.labels[arg].highlight:Destroy()
		end
	end)

	pcall(function()
		if tbl9.labels[arg].line then
			tbl9.labels[arg].line:Destroy()
		end
	end)

	tbl9.labels[arg] = nil
end

espRefreshAvatars = function()
	local enabled = flag34 == true and flag35 == true

	for _, label in pairs(tbl9.labels) do
		if label.avatarBillboard then
			label.avatarBillboard.Enabled = enabled
		end
	end
end

espMakeLabel = function(arg)
	if not arg then
		return
	end
	espRemovePlayer(arg)
	local character = arg.Character
	if not character then
		return
	end
	local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
	if not head then
		return
	end
	local flag37 = arg == localPlayer
	local flag38 = not flag37
	local billboardGui = nil

	if flag38 then
		billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = "MachoESPAvatar"
		billboardGui.AlwaysOnTop = true
		billboardGui.Size = UDim2.new(0, 48, 0, 48)
		billboardGui.StudsOffset = Vector3.new(0, 5, 0)
		billboardGui.MaxDistance = 2000
		billboardGui.Enabled = flag34 == true and flag35 == true
		billboardGui.Parent = head
		local frame = Instance.new("Frame", billboardGui)
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
		frame.BorderSizePixel = 0
		Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0)
		local uiStroke = Instance.new("UIStroke", frame)
		uiStroke.Color = Color3.fromRGB(255, 255, 255)
		uiStroke.Thickness = 2
		local imageLabel = Instance.new("ImageLabel", frame)
		imageLabel.Size = UDim2.new(1, -4, 1, -4)
		imageLabel.Position = UDim2.new(0, 2, 0, 2)
		imageLabel.BackgroundTransparency = 1
		imageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(arg.UserId) .. "&w=150&h=150"
		Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(1, 0)
	end

	local billboardGui2 = Instance.new("BillboardGui")
	billboardGui2.Name = "MachoESPSpeed"
	billboardGui2.AlwaysOnTop = true
	billboardGui2.Size = UDim2.new(0, 200, 0, 44)
	billboardGui2.StudsOffset = Vector3.new(0, flag37 and 3 or 3.6, 0)
	billboardGui2.MaxDistance = 2000
	billboardGui2.Parent = head
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "SpeedLabel"
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Speed: 0"
	textLabel.Font = Enum.Font.GothamBlack
	textLabel.TextSize = 22
	textLabel.TextColor3 = flag37 and Color3.fromRGB(120, 220, 255) or Color3.fromRGB(255, 255, 255)
	textLabel.TextStrokeTransparency = 0.2
	textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.TextScaled = false
	textLabel.Parent = billboardGui2
	local highlight = nil
	local part = nil

	if flag38 then
		highlight = Instance.new("Highlight")
		highlight.Name = "MachoChams"
		highlight.Adornee = character
		highlight.FillColor = Color3.fromRGB(255, 255, 255)
		highlight.FillTransparency = 0.55
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

		pcall(function()
			highlight.Parent = tbl9.folder or workspace
		end)

		part = Instance.new("Part")
		part.Name = "MachoESPLine"
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.CastShadow = false
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromRGB(255, 255, 255)
		part.Transparency = 0.2
		part.Size = Vector3.new(0.05, 0.05, 1)

		pcall(function()
			part.Parent = tbl9.folder or workspace
		end)

		local connection2 = RunService.RenderStepped:Connect(function()
			if not flag34 then
				return
			end
			local character2 = localPlayer.Character
			character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
			local humanoidRootPart = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head"))
			if not character2 or not humanoidRootPart or not part or not part.Parent then
				return
			end
			local position = character2.Position
			local position2 = humanoidRootPart.Position
			part.Size = Vector3.new(0.05, 0.05, (position2 - position).Magnitude)
			part.CFrame = CFrame.lookAt((position + position2) / 2, position2)
		end)

		table.insert(tbl9.conns, connection2)
	end

	local connection2 = RunService.RenderStepped:Connect(function()
		if not flag34 or not textLabel or not textLabel.Parent then
			return
		end
		local character2 = arg.Character
		local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
		character2 = character2 and character2:FindFirstChildOfClass("Humanoid")
		if not humanoidRootPart then
			textLabel.Text = "Speed: 0"
			return
		end
		local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
		local x = assemblyLinearVelocity.X
		local z = assemblyLinearVelocity.Z
		local n18 = math.sqrt(x * x + z * z)

		if flag37 and character2 then
			local moveDirection = character2.MoveDirection
			moveDirection = moveDirection and moveDirection.Magnitude > 0.04 or n18 > 1.5
			local v3 = getActiveMoveSpeed and getActiveMoveSpeed() or nil

			if type(v3) == "number" and v3 > 0 and moveDirection then
				n18 = v3
			elseif type(v3) == "number" and v3 > 0 and n18 > v3 * 0.4 then
				n18 = math.max(n18, v3)
			end
		end

		textLabel.Text = string.format("Speed: %d", math.floor(n18 + 0.5))
	end)

	table.insert(tbl9.conns, connection2)
	tbl9.labels[arg] = { billboard = billboardGui2, avatarBillboard = billboardGui, highlight = highlight, line = part }
end

startESP = function()
	flag34 = true
	espClear()
	tbl9.folder = Instance.new("Folder")
	tbl9.folder.Name = "MachoESPFolder"

	pcall(function()
		tbl9.folder.Parent = workspace
	end)

	for _, player in ipairs(Players:GetPlayers()) do
		espMakeLabel(player)

		table.insert(tbl9.conns, player.CharacterAdded:Connect(function()
			task.wait(0.4)

			if flag34 then
				espMakeLabel(player)
			end
		end))
	end

	table.insert(tbl9.conns, Players.PlayerAdded:Connect(function(player)
		if not flag34 then
			return
		end

		table.insert(tbl9.conns, player.CharacterAdded:Connect(function()
			task.wait(0.4)

			if flag34 then
				espMakeLabel(player)
			end
		end))

		if player.Character then
			espMakeLabel(player)
		end
	end))

	table.insert(tbl9.conns, Players.PlayerRemoving:Connect(function(player)
		espRemovePlayer(player)
	end))
end

stopESP = function()
	flag34 = false
	espClear()

	pcall(function()
		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("BillboardGui") and (descendant.Name == "VoidESPAvatar" or descendant.Name == "MachoESPAvatar" or descendant.Name == "VoidESPSpeed" or descendant.Name == "MachoESPSpeed" or descendant.Name:find("VoidESP") or descendant.Name:find("MachoESP")) then
				descendant:Destroy()
			end

			if descendant:IsA("Highlight") and descendant.Name and (tostring(descendant.Name):find("VoidESP") or tostring(descendant.Name):find("MachoESP")) then
				descendant:Destroy()
			end
		end
	end)

	pcall(function()
		for _, player in ipairs(Players:GetPlayers()) do
			local character = player.Character

			if character then
				for _, descendant in ipairs(character:GetDescendants()) do
					local isBillboardGui = descendant:IsA("BillboardGui")

					if isBillboardGui then
						isBillboardGui = descendant.Name == "VoidESPAvatar" or descendant.Name == "MachoESPAvatar" or descendant.Name == "VoidESPSpeed" or descendant.Name == "MachoESPSpeed" or descendant.Name:find("VoidESP") or descendant.Name:find("MachoESP")
					end

					if isBillboardGui then
						descendant:Destroy()
					end
				end
			end
		end
	end)
end

loadBtnPositions = function()
	if not (isfile and isfile("MachoHUBbtn.json")) then
		return {}
	end

	local ok, result = pcall(function()
		return HttpService:JSONDecode(readfile("MachoHUBbtn.json"))
	end)

	if ok and type(result) == "table" then
		return result
	end
	return {}
end

saveBtnPositions = function()
	if not writefile then
		return
	end

	if not mobGuiRef then
		return
	end
	local mobileButtons = mobGuiRef:FindFirstChild("MobileButtons")
	if not mobileButtons then
		return
	end

	local tbl21 = {
		__group = {
			xs = mobileButtons.Position.X.Scale,
			xo = mobileButtons.Position.X.Offset,
			ys = mobileButtons.Position.Y.Scale,
			yo = mobileButtons.Position.Y.Offset,
		},
	}

	for _, child in ipairs(mobileButtons:GetChildren()) do
		if child:IsA("Frame") then
			tbl21[child.Name] = { xo = child.Position.X.Offset, yo = child.Position.Y.Offset }
		end
	end

	pcall(function()
		writefile("MachoHUBbtn.json", HttpService:JSONEncode(tbl21))
	end)
end

task.spawn(function()
	while true do
		task.wait(3)
		pcall(saveBtnPositions)
	end
end)

refreshSpeedModeLabel = nil
saveConfig = nil
startUnwalk = nil
stopUnwalk = nil
setupMedusa = nil
stopMedusaCounter = nil
startAntiRagdoll = nil
stopAntiRagdoll = nil
startAutoLeft = nil
stopAutoLeft = nil
startAutoRight = nil
stopAutoRight = nil
startAutoTP = nil
stopAutoTP = nil
enableAntiLag = nil
disableAntiLag = nil
enableStretchRez = nil
disableStretchRez = nil
startBatAimbot = nil
stopBatAimbot = nil
queueAutoBatStart = nil
runDrop = nil
runTPFloor = nil
startAutoSteal = nil
stopAutoSteal = nil
toggleCarryMode = nil
toggleLaggerMode = nil

addShimmerToLabel = function(arg, arg2, arg3)
	local uiGradient = Instance.new("UIGradient", arg)
	local colorSequence = ColorSequence.new
	local tbl21 = {}
	local v3 = ColorSequenceKeypoint.new(0, arg2 or Color3.fromRGB(200, 200, 200))
	local v4 = ColorSequenceKeypoint.new(0.5, arg3 or Color3.fromRGB(255, 255, 255))
	local new = ColorSequenceKeypoint.new
	local color2 = arg2 or Color3.fromRGB(200, 200, 200)
	local v5 = table.pack(new(1, color2))
	tbl21[1] = v3
	tbl21[2] = v4

	do
		local values = table.pack(table.unpack(v5, 1, v5.n))
		table.move(values, 1, values.n, 3, tbl21)
	end

	uiGradient.Color = colorSequence(tbl21)
	local numberSequence = NumberSequence.new
	local tbl22 = {}
	local v6 = NumberSequenceKeypoint.new(0, 0.3, 0)
	local v7 = NumberSequenceKeypoint.new(0.5, 0, 0)
	local new2 = NumberSequenceKeypoint.new
	tbl22[1] = v6
	tbl22[2] = v7

	do
		local values = table.pack(new2(1, 0.3, 0))
		table.move(values, 1, values.n, 3, tbl22)
	end

	uiGradient.Transparency = numberSequence(tbl22)
	return uiGradient
end

local connection2 = nil

applyFOV = function()
	if connection2 then
		connection2:Disconnect()
	end

	connection2 = RunService.RenderStepped:Connect(function()
		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			currentCamera.FieldOfView = fieldOfView
		end
	end)
end

applyFOV()

createR... (244 KB left)
