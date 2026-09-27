repeat task.wait() until game:IsLoaded()

-- ===================== VELTRIX HUB - STARTUP SPLASH =====================
do
	local Players = game:GetService("Players")
	local LP2 = Players.LocalPlayer
	local TweenService2 = game:GetService("TweenService")
	local SoundService2 = game:GetService("SoundService")

	local splashGui = Instance.new("ScreenGui")
	splashGui.Name = "VeltrixSplash"
	splashGui.ResetOnSpawn = false
	splashGui.DisplayOrder = 999
	splashGui.IgnoreGuiInset = true
	if not pcall(function() splashGui.Parent = game:GetService("CoreGui") end) then
		splashGui.Parent = LP2:WaitForChild("PlayerGui")
	end

	local overlay = Instance.new("Frame", splashGui)
	overlay.Size = UDim2.new(1,0,1,0)
	overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
	overlay.BackgroundTransparency = 0
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 1

	local tapHint = Instance.new("TextLabel", splashGui)
	tapHint.Size = UDim2.new(1, 0, 0, 20)
	tapHint.Position = UDim2.new(0, 0, 1, -36)
	tapHint.BackgroundTransparency = 1
	tapHint.Text = "tap anywhere to skip"
	tapHint.TextColor3 = Color3.fromRGB(80, 110, 160)
	tapHint.Font = Enum.Font.Gotham
	tapHint.TextSize = 11
	tapHint.ZIndex = 10
	tapHint.TextXAlignment = Enum.TextXAlignment.Center

	local skipZone = Instance.new("TextButton", splashGui)
	skipZone.Size = UDim2.new(1,0,1,0)
	skipZone.BackgroundTransparency = 1
	skipZone.Text = ""
	skipZone.ZIndex = 9

	local container = Instance.new("Frame", splashGui)
	container.Size = UDim2.new(0,320,0,120)
	container.Position = UDim2.new(0.5,-160,0,-140)
	container.BackgroundTransparency = 1
	container.BorderSizePixel = 0
	container.ZIndex = 2
	container.ClipsDescendants = false

	local titleSplash = Instance.new("TextLabel", container)
	titleSplash.Size = UDim2.new(1,0,0,70)
	titleSplash.Position = UDim2.new(0,0,0,0)
	titleSplash.BackgroundTransparency = 1
	titleSplash.Text = "VELTRIX HUB"
	titleSplash.TextColor3 = Color3.fromRGB(255,255,255)
	titleSplash.Font = Enum.Font.GothamBlack
	titleSplash.TextSize = 48
	titleSplash.TextTransparency = 0
	titleSplash.ZIndex = 3
	do
		local g = Instance.new("UIGradient", titleSplash)
		g.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(80,160,255)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200,225,255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(100,80,255))
		})
	end

	local subSplash = Instance.new("TextLabel", container)
	subSplash.Size = UDim2.new(1,0,0,24)
	subSplash.Position = UDim2.new(0,0,0,72)
	subSplash.BackgroundTransparency = 1
	subSplash.Text = "Duels Edition"
	subSplash.TextColor3 = Color3.fromRGB(100,140,200)
	subSplash.Font = Enum.Font.Gotham
	subSplash.TextSize = 13
	subSplash.TextTransparency = 0
	subSplash.ZIndex = 3

	local fragments = {}
	local fragTexts = {"VE","LT","RI","X ","HU","B"}
	local fragColors = {
		Color3.fromRGB(80,160,255),
		Color3.fromRGB(140,100,255),
		Color3.fromRGB(200,225,255),
		Color3.fromRGB(100,80,255),
		Color3.fromRGB(80,180,255),
		Color3.fromRGB(160,120,255),
	}
	for i, txt in ipairs(fragTexts) do
		local frag = Instance.new("TextLabel", splashGui)
		frag.Size = UDim2.new(0,90,0,60)
		frag.AnchorPoint = Vector2.new(0.5,0.5)
		frag.Position = UDim2.new(0.5, (i-3.5)*52, 0.5, -30)
		frag.BackgroundTransparency = 1
		frag.Text = txt
		frag.TextColor3 = fragColors[i]
		frag.Font = Enum.Font.GothamBlack
		frag.TextSize = 44
		frag.TextTransparency = 1
		frag.ZIndex = 5
		frag.Rotation = 0
		table.insert(fragments, frag)
	end

	local function playSound(id, pitch, vol, parent, delay)
		task.delay(delay or 0, function()
			local s = Instance.new("Sound")
			s.SoundId = id
			s.PlaybackSpeed = pitch
			s.Volume = vol
			s.Parent = parent
			s.RollOffMaxDistance = 0
			s:Play()
			game:GetService("Debris"):AddItem(s, 3)
		end)
	end

	local function playGlitchImpact()
		playSound("rbxassetid://1588058260", 1.0, 0.9, SoundService2, 0)
		playSound("rbxassetid://8627516764", 0.8, 0.7, SoundService2, 0.02)
		playSound("rbxassetid://1588058260", 1.4, 0.5, SoundService2, 0.05)
		playSound("rbxassetid://8627516764", 1.2, 0.4, SoundService2, 0.1)
	end

	local function playWhistle()
		local WHISTLE_ID = "rbxassetid://4612414100"
		playSound(WHISTLE_ID, 2.2, 0.7, SoundService2, 0)
		playSound(WHISTLE_ID, 1.7, 0.8, SoundService2, 0.07)
		playSound(WHISTLE_ID, 1.2, 0.9, SoundService2, 0.15)
		playSound(WHISTLE_ID, 0.85, 0.9, SoundService2, 0.24)
		playSound(WHISTLE_ID, 0.55, 0.7, SoundService2, 0.34)
		playSound(WHISTLE_ID, 0.3, 1.0, SoundService2, 0.5)
	end

	local function doShatterEffect()
		pcall(playGlitchImpact)
		local flash = Instance.new("Frame", splashGui)
		flash.Size = UDim2.new(1,0,1,0)
		flash.BackgroundColor3 = Color3.fromRGB(255,255,255)
		flash.BackgroundTransparency = 0.3
		flash.BorderSizePixel = 0
		flash.ZIndex = 8
		TweenService2:Create(flash, TweenInfo.new(0.18), {BackgroundTransparency=1}):Play()
		game:GetService("Debris"):AddItem(flash, 0.3)
		titleSplash.TextTransparency = 1
		local RunService2 = game:GetService("RunService")
		for i, frag in ipairs(fragments) do
			frag.TextTransparency = 0
			local dirX = (i - 3.5) * 60 + math.random(-80, 80)
			local dirY = math.random(120, 280)
			local rot = math.random(-180, 180)
			local startPosX = frag.Position.X.Offset
			local startPosY = frag.Position.Y.Offset
			local t = 0
			local conn
			conn = RunService2.RenderStepped:Connect(function(dt)
				t = t + dt
				if t > 0.8 then frag.TextTransparency = 1; conn:Disconnect(); return end
				local alpha = t / 0.8
				local px = startPosX + dirX * alpha
				local py = startPosY - dirY * alpha + 300 * alpha * alpha
				local fade = math.clamp(alpha * 1.4 - 0.3, 0, 1)
				frag.Position = UDim2.new(0.5, px, 0.5, py - 30)
				frag.Rotation = rot * alpha
				frag.TextTransparency = fade
				frag.TextSize = math.clamp(44 - alpha * 20, 10, 44)
			end)
		end
		for li = 1, 8 do
			task.delay(li * 0.025, function()
				local line = Instance.new("Frame", splashGui)
				line.Size = UDim2.new(1, 0, 0, math.random(2,6))
				line.Position = UDim2.new(0, 0, math.random(), 0)
				line.BackgroundColor3 = Color3.fromRGB(math.random(60,255), math.random(0,100), math.random(150,255))
				line.BackgroundTransparency = math.random() * 0.3
				line.BorderSizePixel = 0
				line.ZIndex = 7
				TweenService2:Create(line, TweenInfo.new(0.12), {BackgroundTransparency=1}):Play()
				game:GetService("Debris"):AddItem(line, 0.2)
			end)
		end
	end

	local splashDone = false
	local function finishSplash()
		if splashDone then return end
		splashDone = true
		TweenService2:Create(subSplash, TweenInfo.new(0.3), {TextTransparency=1}):Play()
		TweenService2:Create(overlay, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
		tapHint.Visible = false
	end

	skipZone.MouseButton1Click:Connect(function()
		titleSplash.TextTransparency = 1
		subSplash.TextTransparency = 1
		finishSplash()
	end)

	task.spawn(function()
		TweenService2:Create(overlay, TweenInfo.new(0.2), {BackgroundTransparency=0.1}):Play()
		task.wait(0.15)
		pcall(playWhistle)
		TweenService2:Create(container, TweenInfo.new(0.45, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
			{Position=UDim2.new(0.5,-160,0.5,-60)}):Play()
		task.wait(0.5)
		doShatterEffect()
		task.wait(0.85)
		finishSplash()
		task.wait(0.45)
		if splashGui and splashGui.Parent then splashGui:Destroy() end
	end)

	local _t0 = tick()
	while not splashDone and (tick() - _t0) < 3.0 do
		task.wait(0.05)
	end
end

-- ===================== SERVICES =====================
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS        = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService  = game:GetService("HttpService")
local Lighting     = game:GetService("Lighting")
local LP = Players.LocalPlayer

-- ===================== CONSTANTS =====================
local NORMAL_SPEED  = 60
local CARRY_SPEED   = 30
local LAGGER_SPEED  = 24
local LAGGER_SLOW   = 12
local MEDUSA_COOLDOWN = 25
local BAT_SWING_COOLDOWN = 0.06
-- FASTER BAT SPEED (was 46, now 75 for faster rush)
local BAT_SPEED          = 75
-- Engage distance (closer = more aggressive)
local BAT_ENGAGE_DIST    = 12

-- ===================== STATE =====================
local speedMode           = false
local laggerMode          = false
local antiRagdollEnabled  = false
local infJumpEnabled      = false
local medusaCounterEnabled= false
local unwalkEnabled       = false
local floatEnabled        = false
local floatHeight         = 9.5
local floatJumping        = false
local stretchRezEnabled   = false
local _anyKeyListening    = false
local guiLocked           = false
local noCollisionEnabled  = false
local noCollisionConn     = nil
local dropActive          = false
local batRevengeEnabled   = false
local batRevengeCooldown  = false
local batRevengeActive    = false
local batRevengeStateConn = nil

local aimbotShiftLock = true

-- ===================== AUTO TP STATE =====================
local autoTPEnabled = false
local autoTPConn = nil

local autoBatEnabled = false
local _lastBatSwing  = 0
local _lastBatMove   = 0
local Connections    = {batAimbot = nil}

-- ===================== AUTO PLAY STATE =====================
local autoPlayEnabled = false
local autoPlayConn = nil
local autoPlayPhase = 1
local autoPlayDirection = "left"
local autoPlaySetVisual = nil

local LEFT_SIDE_Z  = 90
local RIGHT_SIDE_Z = 28

local FAP_L1 = Vector3.new(-476.48, -6.28, 92.73)
local FAP_L2 = Vector3.new(-482.85, -5.03, 93.13)
local FAP_L3 = Vector3.new(-475.68, -6.89, 92.76)
local FAP_L4 = Vector3.new(-476.50, -6.46, 27.58)
local FAP_L5 = Vector3.new(-482.42, -5.03, 27.84)
local FAP_R1 = Vector3.new(-476.16, -6.52, 25.62)
local FAP_R2 = Vector3.new(-483.06, -5.03, 27.51)
local FAP_R3 = Vector3.new(-476.21, -6.63, 27.46)
local FAP_R4 = Vector3.new(-476.66, -6.39, 92.44)
local FAP_R5 = Vector3.new(-481.94, -5.03, 92.42)
local FACE_FAP_L = Vector3.new(-482.25, -4.96, 92.09)
local FACE_FAP_R = Vector3.new(-482.06, -6.93, 35.47)

local Steal = {
	AutoStealEnabled = false,
	StealRadius = 20,
	StealDuration = 0.25,
	Data = {},
	plotCache = {},
	plotCacheTime = {},
	cachedPrompts = {},
	promptCacheTime = 0
}
local isStealing = false
local stealStartTime = 0
local lastStealTick = 0
local Conns = {autoSteal = nil, antiRag = nil, float = nil, progress = nil}

local tpDownCooldown = false
local _wfConns = {}
local _wfActive = false

local desyncEnabled = false
local setDesyncRowToggle = nil

local function getAutoSpeeds()
	if laggerMode then
		return LAGGER_SPEED, LAGGER_SPEED, LAGGER_SLOW, LAGGER_SLOW
	else
		return NORMAL_SPEED, NORMAL_SPEED, CARRY_SPEED, CARRY_SPEED
	end
end

local function applyDesync(state)
	desyncEnabled = state
	pcall(function()
		if raknet then raknet.desync(state) end
	end)
	if setDesyncRowToggle then setDesyncRowToggle(state) end
	if mobBtnRefs and mobBtnRefs["Desync"] then
		TweenService:Create(mobBtnRefs["Desync"], TweenInfo.new(0.15), {
			BackgroundColor3 = state and Color3.fromRGB(0,100,80) or Color3.fromRGB(9,11,30)
		}):Play()
	end
end

-- ===================== KEYBINDS =====================
local KB = {
	DropBrainrot  = {kb=Enum.KeyCode.X, gp=nil},
	AutoPlay      = {kb=Enum.KeyCode.Z, gp=nil},
	AutoBat       = {kb=Enum.KeyCode.E, gp=nil},
	GuiHide       = {kb=Enum.KeyCode.LeftControl, gp=nil},
	Float         = {kb=Enum.KeyCode.J, gp=nil},
	SpeedToggle   = {kb=Enum.KeyCode.Q, gp=nil},
	TPDown        = {kb=Enum.KeyCode.F, gp=nil},
	LaggerToggle  = {kb=Enum.KeyCode.L, gp=nil},
	BatRevenge    = {kb=Enum.KeyCode.F6, gp=nil},
	Taunt         = {kb=Enum.KeyCode.T, gp=nil},
}
local function kbMatch(e,kc) return kc==e.kb or (e.gp~=nil and kc==e.gp) end

-- ===================== TAUNT =====================
local tauntMessage = "veltrix owns you"
local tauntCooldown = false
local function sendTaunt()
	local sent = false
	if not sent then
		pcall(function()
			local tcs = game:GetService("TextChatService")
			if tcs and tcs.TextChannels then
				local ch = tcs.TextChannels:FindFirstChild("RBXGeneral")
				if ch then ch:SendAsync(tauntMessage); sent = true end
			end
		end)
	end
	if not sent then
		pcall(function()
			local rs = game:GetService("ReplicatedStorage")
			local remote = rs:FindFirstChild("SayMessageRequest")
				or (rs:FindFirstChild("DefaultChatSystemChatEvents")
					and rs.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest"))
			if remote and remote:IsA("RemoteEvent") then
				remote:FireServer(tauntMessage, "All")
				sent = true
			end
		end)
	end
	if not sent then
		pcall(function() LP:Chat(tauntMessage) end)
	end
end
local function sendTauntWithCooldown()
	if tauntCooldown then return end
	tauntCooldown = true
	sendTaunt()
	task.delay(2, function() tauntCooldown = false end)
end

-- ===================== BAT AIMBOT =====================
local function findBat()
	local char = LP.Character; if not char then return nil end
	local bp = LP:FindFirstChildOfClass("Backpack")
	for _, ch in ipairs(char:GetChildren()) do
		if ch:IsA("Tool") and (ch.Name:lower():find("bat") or ch.Name:lower():find("slap")) then return ch end
	end
	if bp then
		for _, ch in ipairs(bp:GetChildren()) do
			if ch:IsA("Tool") and (ch.Name:lower():find("bat") or ch.Name:lower():find("slap")) then return ch end
		end
	end
end

local function getClosestPlayer()
	local c = LP.Character; if not c then return nil end
	local hrp = c:FindFirstChild("HumanoidRootPart"); if not hrp then return nil end
	local cp, cd = nil, math.huge
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LP and p.Character then
			local tr = p.Character:FindFirstChild("HumanoidRootPart")
			if tr then
				local d = (hrp.Position - tr.Position).Magnitude
				if d < cd then cd = d; cp = p end
			end
		end
	end
	return cp
end

-- ===================== IMPROVED BAT AIMBOT (faster, no lag, no reset) =====================
local function startBatAimbot()
	if Connections.batAimbot then
		Connections.batAimbot:Disconnect()
		Connections.batAimbot = nil
	end
	Connections.batAimbot = RunService.Heartbeat:Connect(function()
		if not autoBatEnabled then return end
		local now = tick()
		local c = LP.Character; if not c then return end
		local hrp = c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
		local hum = c:FindFirstChildOfClass("Humanoid"); if not hum then return end

		local target = getClosestPlayer()
		if target and target.Character then
			local tr = target.Character:FindFirstChild("HumanoidRootPart")
			if tr then
				local tVel = tr.AssemblyLinearVelocity
				local dist = (tr.Position - hrp.Position).Magnitude
				-- Prediction: 0.3 seconds ahead for smooth following
				local travelTime = math.clamp(dist / BAT_SPEED, 0, 0.3)
				local predictedPos = tr.Position + Vector3.new(tVel.X * travelTime, 0, tVel.Z * travelTime)
				local dir = (predictedPos - hrp.Position)

				if dir.Magnitude > 0.1 then
					local dirUnit = dir.Unit
					-- Set velocity directly (full speed) – no braking to avoid lag/rubberband
					local yDiff = tr.Position.Y - hrp.Position.Y
					local velY = math.clamp(yDiff * 10, -BAT_SPEED, BAT_SPEED)
					hrp.AssemblyLinearVelocity = Vector3.new(dirUnit.X * BAT_SPEED, velY, dirUnit.Z * BAT_SPEED)

					-- Camera shiftlock (always follow target)
					local flatDir = Vector3.new(dir.X, 0, dir.Z)
					if flatDir.Magnitude > 0.1 then
						local cam = workspace.CurrentCamera
						local camPos = cam.CFrame.Position
						local lookAt = Vector3.new(predictedPos.X, camPos.Y, predictedPos.Z)
						cam.CFrame = CFrame.new(camPos, lookAt)
					end
				end

				-- Swing bat when within engage range
				local bat = findBat()
				if bat then
					if bat.Parent ~= c then hum:EquipTool(bat) end
					if now - _lastBatSwing >= BAT_SWING_COOLDOWN and dist < BAT_ENGAGE_DIST then
						_lastBatSwing = now
						pcall(function() bat:Activate() end)
					end
				end
			end
		end
	end)
end

local function stopBatAimbot()
	if Connections.batAimbot then Connections.batAimbot:Disconnect(); Connections.batAimbot = nil end
	autoBatEnabled = false
	local c = LP.Character
	if c then
		local hrp = c:FindFirstChild("HumanoidRootPart")
		if hrp then hrp.AssemblyLinearVelocity = Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0) end
	end
end

local startAutoBat = startBatAimbot
local stopAutoBat  = stopBatAimbot

-- ===================== AUTO TP =====================
local function runTPDown()
	local char=LP.Character;if not char then return end
	local hrp=char:FindFirstChild("HumanoidRootPart");if not hrp then return end
	local excludeList={}
	for _,p in ipairs(char:GetDescendants()) do if p:IsA("BasePart") then table.insert(excludeList,p) end end
	table.insert(excludeList,hrp)
	local rp=RaycastParams.new()
	rp.FilterDescendantsInstances=excludeList;rp.FilterType=Enum.RaycastFilterType.Exclude
	local rr=workspace:Raycast(hrp.Position+Vector3.new(0,-0.1,0),Vector3.new(0,-2000,0),rp)
	local yaw=select(2,hrp.CFrame:ToEulerAnglesYXZ())
	if rr and rr.Position.Y > -200 then
		hrp.CFrame=CFrame.new(hrp.Position.X,rr.Position.Y+3.1,hrp.Position.Z)*CFrame.Angles(0,yaw,0)
		if not floatEnabled then
			hrp.AssemblyLinearVelocity=Vector3.zero
		else
			hrp.AssemblyLinearVelocity=Vector3.new(hrp.AssemblyLinearVelocity.X,0,hrp.AssemblyLinearVelocity.Z)
		end
	end
end

local function startAutoTP()
	if autoTPConn then autoTPConn:Disconnect(); autoTPConn = nil end
	autoTPConn = RunService.Heartbeat:Connect(function()
		if not autoTPEnabled then return end
		if floatEnabled then return end
		if autoPlayEnabled then return end
		local char = LP.Character; if not char then return end
		local hrp = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
		if hrp.AssemblyLinearVelocity.Y > -10 then return end
		local excludeList = {}
		for _, p in ipairs(char:GetDescendants()) do
			if p:IsA("BasePart") then table.insert(excludeList, p) end
		end
		table.insert(excludeList, hrp)
		local rp = RaycastParams.new()
		rp.FilterDescendantsInstances = excludeList
		rp.FilterType = Enum.RaycastFilterType.Exclude
		local rr = workspace:Raycast(hrp.Position + Vector3.new(0,-0.1,0), Vector3.new(0,-2000,0), rp)
		if rr and rr.Position.Y > -200 then
			local yaw = select(2, hrp.CFrame:ToEulerAnglesYXZ())
			hrp.CFrame = CFrame.new(hrp.Position.X, rr.Position.Y + 3.1, hrp.Position.Z) * CFrame.Angles(0, yaw, 0)
			hrp.AssemblyLinearVelocity = Vector3.zero
		end
	end)
end

local function stopAutoTP()
	if autoTPConn then autoTPConn:Disconnect(); autoTPConn = nil end
end

-- ===================== BAT REVENGE (FIXED: no teleport, just swing) =====================
local function isInActiveDuel()
	local c=LP.Character;if not c then return false end
	local hrp=c:FindFirstChild("HumanoidRootPart");if not hrp then return false end
	local hum=c:FindFirstChildOfClass("Humanoid");if not hum or hum.Health<=0 then return false end
	for _,p in ipairs(Players:GetPlayers()) do
		if p~=LP and p.Character then
			local eh=p.Character:FindFirstChild("HumanoidRootPart")
			local eHum=p.Character:FindFirstChildOfClass("Humanoid")
			if eh and eHum and eHum.Health>0 and (hrp.Position-eh.Position).Magnitude<120 then return true end
		end
	end
	return false
end

local function doBatRevenge()
	if batRevengeCooldown or batRevengeActive then return end
	if not isInActiveDuel() then return end
	batRevengeCooldown=true;batRevengeActive=true
	task.spawn(function()
		local c=LP.Character
		if not c then batRevengeCooldown=false;batRevengeActive=false;return end
		local hum=c:FindFirstChildOfClass("Humanoid")
		local hrp=c:FindFirstChild("HumanoidRootPart")
		if not hum or not hrp or hum.Health<=0 then batRevengeCooldown=false;batRevengeActive=false;return end
		if not isInActiveDuel() then batRevengeCooldown=false;batRevengeActive=false;return end

		local bat = findBat()
		if not bat then batRevengeCooldown=false;batRevengeActive=false;return end
		if bat.Parent~=c then pcall(function() hum:EquipTool(bat) end);task.wait(0.05) end
		if not bat or bat.Parent~=c then batRevengeCooldown=false;batRevengeActive=false;return end

		-- No teleport, just swing multiple times
		for i=1,4 do
			if bat and bat.Parent==c then pcall(function() bat:Activate() end) end
			task.wait(0.08)
		end

		batRevengeCooldown=false;batRevengeActive=false
	end)
end

local function startBatRevenge()
	if batRevengeStateConn then batRevengeStateConn:Disconnect();batRevengeStateConn=nil end
	local c=LP.Character;if not c then return end
	local hum=c:WaitForChild("Humanoid",5);if not hum then return end
	local spawnTime=tick()
	batRevengeStateConn=hum.StateChanged:Connect(function(_,newState)
		if not batRevengeEnabled then return end
		if (tick()-spawnTime)<5.5 then return end
		if hum.Health<=0 then return end
		if not isInActiveDuel() then return end
		if newState==Enum.HumanoidStateType.Physics or newState==Enum.HumanoidStateType.Ragdoll or newState==Enum.HumanoidStateType.FallingDown then
			if hum.Health>1 then doBatRevenge() end
		end
	end)
end

local function stopBatRevengeFunc()
	batRevengeEnabled=false
	if batRevengeStateConn then batRevengeStateConn:Disconnect();batRevengeStateConn=nil end
	batRevengeCooldown=false;batRevengeActive=false
end

-- ===================== DROP =====================
local function startWalkFling()
	_wfActive = true
	table.insert(_wfConns, RunService.Stepped:Connect(function()
		if not _wfActive then return end
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and p.Character then
				for _, part in ipairs(p.Character:GetChildren()) do
					if part:IsA("BasePart") then part.CanCollide = false end
				end
			end
		end
	end))
	local t = task.spawn(function()
		while _wfActive do
			RunService.Heartbeat:Wait()
			local c = LP.Character
			local root = c and c:FindFirstChild("HumanoidRootPart")
			if not root then continue end
			if root.Position.Y < -100 then _wfActive = false; break end
			local vel = root.AssemblyLinearVelocity
			root.AssemblyLinearVelocity = vel * 10000 + Vector3.new(0, 10000, 0)
			RunService.RenderStepped:Wait()
			if root and root.Parent then root.AssemblyLinearVelocity = vel end
			RunService.Stepped:Wait()
			if root and root.Parent then root.AssemblyLinearVelocity = vel + Vector3.new(0, 0.1, 0) end
		end
	end)
	table.insert(_wfConns, t)
end

local function stopWalkFling()
	_wfActive = false
	for _, conn in ipairs(_wfConns) do
		if typeof(conn) == "RBXScriptConnection" then conn:Disconnect()
		elseif typeof(conn) == "thread" then pcall(task.cancel, conn) end
	end
	_wfConns = {}
end

local function runDrop()
	if dropActive then return end
	dropActive = true
	startWalkFling()
	task.spawn(function()
		task.wait(0.4)
		stopWalkFling()
		dropActive = false
		local c = LP.Character
		local root = c and c:FindFirstChild("HumanoidRootPart")
		if root and root.Parent then root.AssemblyLinearVelocity = Vector3.zero end
	end)
end

-- ===================== AUTO PLAY =====================
local function smoothFaceDirection(hrp, targetPos)
	if not hrp then return end
	local direction = (targetPos - hrp.Position).Unit
	local newCFrame = CFrame.new(hrp.Position, hrp.Position + direction)
	TweenService:Create(hrp, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = newCFrame}):Play()
end

local function stopAutoPlay()
	autoPlayEnabled = false
	if autoPlayConn then autoPlayConn:Disconnect(); autoPlayConn = nil end
	autoPlayPhase = 1
	local char = LP.Character
	if char then
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if hrp then hrp.AssemblyLinearVelocity = Vector3.zero end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then hum.WalkSpeed = 16 end
	end
end

local function startAutoPlay(direction)
	stopAutoPlay()
	autoPlayPhase = 1
	autoPlayEnabled = true
	autoPlayDirection = direction or autoPlayDirection

	local pts, facePt
	if autoPlayDirection == "right" then
		pts = {FAP_R1, FAP_R2, FAP_R3, FAP_R4, FAP_R5}
		facePt = FACE_FAP_R
	else
		pts = {FAP_L1, FAP_L2, FAP_L3, FAP_L4, FAP_L5}
		facePt = FACE_FAP_L
	end

	autoPlayConn = RunService.Heartbeat:Connect(function()
		if not autoPlayEnabled then return end
		local c = LP.Character; if not c then return end
		local root = c:FindFirstChild("HumanoidRootPart"); if not root then return end
		local ph = autoPlayPhase
		local tgt = pts[ph]; if not tgt then return end
		local spd = (ph >= 3) and CARRY_SPEED or NORMAL_SPEED
		if laggerMode then spd = (ph >= 3) and LAGGER_SLOW or LAGGER_SPEED end

		if (Vector3.new(tgt.X, root.Position.Y, tgt.Z) - root.Position).Magnitude < 1 then
			if ph == 5 then
				root.AssemblyLinearVelocity = Vector3.zero
				stopAutoPlay()
				if autoPlaySetVisual then autoPlaySetVisual(false) end
				if mobBtnRefs and mobBtnRefs["AutoPlay"] then
					TweenService:Create(mobBtnRefs["AutoPlay"],TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(8,10,26)}):Play()
				end
				smoothFaceDirection(root, facePt)
				return
			elseif ph == 2 then
				root.AssemblyLinearVelocity = Vector3.zero
				task.wait(0.05); autoPlayPhase = 3; return
			else
				autoPlayPhase = ph + 1; return
			end
		end

		local d = tgt - root.Position
		local mv = Vector3.new(d.X, 0, d.Z).Unit
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum and hum.WalkSpeed < spd then hum.WalkSpeed = spd end

		root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
	end)
end

-- ===================== ANTI RAGDOLL =====================
local function startAntiRagdoll()
	if Conns.antiRag then return end
	Conns.antiRag = RunService.Heartbeat:Connect(function()
		if not antiRagdollEnabled then return end
		local char = LP.Character; if not char then return end
		local hum = char:FindFirstChildOfClass("Humanoid")
		local root = char:FindFirstChild("HumanoidRootPart")
		if hum then
			local st = hum:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown then
				pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false) end)
				pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false) end)
				hum:ChangeState(Enum.HumanoidStateType.Running)
				workspace.CurrentCamera.CameraSubject = hum
				if root then
					root.AssemblyLinearVelocity = Vector3.zero
					root.AssemblyAngularVelocity = Vector3.zero
				end
				if char then
					for _, obj in ipairs(char:GetDescendants()) do
						if obj:IsA("Motor6D") and not obj.Enabled then obj.Enabled = true end
					end
				end
			end
		end
	end)
end
local function stopAntiRagdoll()
	if Conns.antiRag then Conns.antiRag:Disconnect(); Conns.antiRag = nil end
	local char = LP.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true) end)
			pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true) end)
		end
	end
end

-- ===================== INFINITE JUMP =====================
local jumpBoost = 55
local IJ_JumpConn, IJ_FallConn = nil, nil
local function startInfiniteJump()
	if IJ_JumpConn then IJ_JumpConn:Disconnect() end
	if IJ_FallConn then IJ_FallConn:Disconnect() end
	IJ_JumpConn = UIS.JumpRequest:Connect(function()
		if not infJumpEnabled then return end
		local char = LP.Character; if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if root then root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, jumpBoost, root.AssemblyLinearVelocity.Z) end
	end)
	IJ_FallConn = RunService.Heartbeat:Connect(function()
		if not infJumpEnabled then return end
		local char = LP.Character; if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if root and root.AssemblyLinearVelocity.Y < -120 then
			root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, -120, root.AssemblyLinearVelocity.Z)
		end
	end)
end
local function stopInfiniteJump()
	if IJ_JumpConn then IJ_JumpConn:Disconnect(); IJ_JumpConn = nil end
	if IJ_FallConn then IJ_FallConn:Disconnect(); IJ_FallConn = nil end
end

-- ===================== NO COLLISION =====================
local function startNoCollision()
	if noCollisionConn then noCollisionConn:Disconnect(); noCollisionConn = nil end
	local lastPushTime = 0
	local lastCollTime = 0
	noCollisionConn = RunService.Heartbeat:Connect(function(dt)
		if not noCollisionEnabled then return end
		local char = LP.Character
		local myRoot = char and char:FindFirstChild("HumanoidRootPart")
		if not myRoot then return end
		local now = tick()
		if now - lastCollTime >= 0.2 then
			lastCollTime = now
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP and p.Character then
					for _, part in ipairs(p.Character:GetChildren()) do
						if part:IsA("BasePart") then part.CanCollide = false end
					end
				end
			end
		end
		if now - lastPushTime < 0.1 then return end
		lastPushTime = now
		local pushStrength = 70
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and p.Character then
				local enemyRoot = p.Character:FindFirstChild("HumanoidRootPart")
				local enemyHum = p.Character:FindFirstChildOfClass("Humanoid")
				if enemyRoot and enemyHum and enemyHum.Health > 0 then
					local dir = (enemyRoot.Position - myRoot.Position)
					local dist = dir.Magnitude
					if dist < 15 then
						local pushDir = dir.Unit
						local scale = math.min(1.5, 15 / math.max(1, dist))
						local vel = enemyRoot.AssemblyLinearVelocity
						enemyRoot.AssemblyLinearVelocity = vel + pushDir * pushStrength * scale
					end
				end
			end
		end
	end)
end
local function stopNoCollision()
	if noCollisionConn then noCollisionConn:Disconnect(); noCollisionConn = nil end
end

-- ===================== MEDUSA =====================
local medusaConns = {}
local medusaDebounce = false
local medusaLastUsed = 0
local function findMedusa()
	local char = LP.Character; if not char then return nil end
	for _, t in ipairs(char:GetChildren()) do
		if t:IsA("Tool") and (t.Name:lower():find("medusa") or t.Name:lower():find("head") or t.Name:lower():find("stone")) then return t end
	end
	local bp = LP:FindFirstChild("Backpack")
	if bp then
		for _, t in ipairs(bp:GetChildren()) do
			if t:IsA("Tool") and (t.Name:lower():find("medusa") or t.Name:lower():find("head") or t.Name:lower():find("stone")) then return t end
		end
	end
end
local function useMedusa()
	if medusaDebounce or tick() - medusaLastUsed < MEDUSA_COOLDOWN then return end
	local char = LP.Character; if not char then return end
	medusaDebounce = true
	local med = findMedusa()
	if med then
		if med.Parent ~= char then
			local h = char:FindFirstChildOfClass("Humanoid")
			if h then h:EquipTool(med) end
		end
		pcall(function() med:Activate() end)
		medusaLastUsed = tick()
	end
	medusaDebounce = false
end
local function onAnchorChanged(part)
	return part:GetPropertyChangedSignal("Anchored"):Connect(function()
		if part.Anchored and part.Transparency == 1 and medusaCounterEnabled then useMedusa() end
	end)
end
local function setupMedusa(char)
	for _, c in pairs(medusaConns) do pcall(function() c:Disconnect() end) end
	medusaConns = {}
	if not char then return end
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then table.insert(medusaConns, onAnchorChanged(part)) end
	end
	table.insert(medusaConns, char.DescendantAdded:Connect(function(part)
		if part:IsA("BasePart") then table.insert(medusaConns, onAnchorChanged(part)) end
	end))
end

-- ===================== FLOAT =====================
local function startFloat()
	if Conns.float then Conns.float:Disconnect() end
	Conns.float = RunService.Heartbeat:Connect(function()
		if not floatEnabled or dropActive then return end
		local char = LP.Character; if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart"); if not root then return end
		local rp = RaycastParams.new()
		rp.FilterDescendantsInstances = {char}
		rp.FilterType = Enum.RaycastFilterType.Exclude
		local rr = workspace:Raycast(root.Position, Vector3.new(0, -200, 0), rp)
		if rr then
			local diff = (rr.Position.Y + floatHeight) - root.Position.Y
			if floatJumping then
				if root.AssemblyLinearVelocity.Y <= 0 and diff >= -2 then floatJumping = false else return end
			end
			if math.abs(diff) > 0.3 then
				root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, diff * 15, root.AssemblyLinearVelocity.Z)
			else
				root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 0, root.AssemblyLinearVelocity.Z)
			end
		end
	end)
end
local function stopFloat()
	if Conns.float then Conns.float:Disconnect(); Conns.float = nil end
	local char = LP.Character
	if char then
		local root = char:FindFirstChild("HumanoidRootPart")
		if root then root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 0, root.AssemblyLinearVelocity.Z) end
	end
end

-- ===================== STRETCH REZ =====================
local stretchRezConn = nil
local function enableStretchRez()
	stretchRezEnabled = true
	workspace.CurrentCamera.FieldOfView = 120
	if stretchRezConn then stretchRezConn:Disconnect() end
	stretchRezConn = RunService.RenderStepped:Connect(function()
		if not stretchRezEnabled then stretchRezConn:Disconnect(); stretchRezConn = nil; return end
		workspace.CurrentCamera.FieldOfView = 120
	end)
end
local function disableStretchRez()
	stretchRezEnabled = false
	if stretchRezConn then stretchRezConn:Disconnect(); stretchRezConn = nil end
	workspace.CurrentCamera.FieldOfView = 70
end

-- ===================== UNWALK =====================
local unwalkAnimations = {}
local function disableAnimations()
	local char = LP.Character; if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
	unwalkAnimations = {}
	local animator = hum:FindFirstChildOfClass("Animator")
	if animator then
		local tracks = animator:GetPlayingAnimationTracks()
		for _, track in pairs(tracks) do
			pcall(function() track:Stop(0) end)
		end
	end
	pcall(function()
		for _, track in pairs(hum:GetPlayingAnimationTracks()) do
			track:Stop(0)
		end
	end)
end
local _unwalkLoopActive = false
local function startUnwalkLoop()
	if _unwalkLoopActive then return end
	_unwalkLoopActive = true
	task.spawn(function()
		while _unwalkLoopActive and unwalkEnabled do
			task.wait(0.15)
			if unwalkEnabled then disableAnimations() end
		end
		_unwalkLoopActive = false
	end)
end

-- ===================== FPS BOOST =====================
local fpsBoostEnabled = false
local fpsBoostDescConn = nil
local function fpsBoosted_processObj(obj)
	pcall(function()
		if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then obj.Enabled = false end
		if obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency = 1 end
		if obj:IsA("BasePart") then obj.Material = Enum.Material.Plastic; obj.Reflectance = 0; obj.CastShadow = false end
		if obj:IsA("Accessory") or obj:IsA("Hat") then obj:Destroy() end
	end)
end
local function optimizeLighting()
	pcall(function()
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 9e8
		Lighting.Brightness = 1
		Lighting.EnvironmentDiffuseScale = 0
		Lighting.EnvironmentSpecularScale = 0
		for _, effect in pairs(Lighting:GetChildren()) do
			if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
				pcall(function() effect.Enabled = false end)
			end
		end
	end)
end
local function enableFPSBoost()
	fpsBoostEnabled = true
	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
	optimizeLighting()
	for _, obj in pairs(workspace:GetDescendants()) do fpsBoosted_processObj(obj) end
	if fpsBoostDescConn then fpsBoostDescConn:Disconnect() end
	fpsBoostDescConn = workspace.DescendantAdded:Connect(fpsBoosted_processObj)
end
local function disableFPSBoost()
	fpsBoostEnabled = false
	if fpsBoostDescConn then fpsBoostDescConn:Disconnect(); fpsBoostDescConn = nil end
end

-- ===================== STEAL =====================
local function isMyPlotByName(n)
	local ct = tick()
	if Steal.plotCache[n] and (ct - (Steal.plotCacheTime[n] or 0)) < 2 then return Steal.plotCache[n] end
	local plots = workspace:FindFirstChild("Plots")
	if not plots then Steal.plotCache[n] = false; Steal.plotCacheTime[n] = ct; return false end
	local plot = plots:FindFirstChild(n)
	if not plot then Steal.plotCache[n] = false; Steal.plotCacheTime[n] = ct; return false end
	local sign = plot:FindFirstChild("PlotSign")
	if sign then
		local yb = sign:FindFirstChild("YourBase")
		if yb and yb:IsA("BillboardGui") then
			local r = yb.Enabled == true
			Steal.plotCache[n] = r; Steal.plotCacheTime[n] = ct; return r
		end
	end
	Steal.plotCache[n] = false; Steal.plotCacheTime[n] = ct; return false
end

local function findNearestPrompt()
	local char = LP.Character; if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart"); if not root then return nil end
	local ct = tick()
	if ct - Steal.promptCacheTime < 0.15 and #Steal.cachedPrompts > 0 then
		local np, nd = nil, math.huge
		for _, d in ipairs(Steal.cachedPrompts) do
			if d.spawn then
				local dist = (d.spawn.Position - root.Position).Magnitude
				if dist <= Steal.StealRadius and dist < nd then np = d.prompt; nd = dist end
			end
		end
		if np then return np end
	end
	Steal.cachedPrompts = {}; Steal.promptCacheTime = ct
	local plots = workspace:FindFirstChild("Plots"); if not plots then return nil end
	local np, nd = nil, math.huge
	for _, plot in ipairs(plots:GetChildren()) do
		if isMyPlotByName(plot.Name) then continue end
		local pods = plot:FindFirstChild("AnimalPodiums"); if not pods then continue end
		for _, pod in ipairs(pods:GetChildren()) do
			pcall(function()
				local base = pod:FindFirstChild("Base")
				local sp = base and (base:FindFirstChild("SpawnPoint") or base:FindFirstChild("Spawn"))
				if sp then
					local att = sp:FindFirstChild("PromptAttachment")
					if att then
						for _, child in ipairs(att:GetChildren()) do
							if child:IsA("ProximityPrompt") then
								local dist = (sp.Position - root.Position).Magnitude
								table.insert(Steal.cachedPrompts, {prompt = child, spawn = sp})
								if dist <= Steal.StealRadius and dist < nd then np = child; nd = dist end
								break
							end
						end
					end
				end
			end)
		end
	end
	return np
end

local progressFill = nil
local progressPct = nil
local progressRadLbl = nil

local function resetProgressBar()
	if progressPct then progressPct.Text = "0%" end
	if progressFill then progressFill.Size = UDim2.new(0,0,1,0) end
end

local function executeSteal(prompt)
	local ct = tick()
	if ct - lastStealTick < 0.1 then return end
	if isStealing then return end
	if Steal.Data[prompt] and not pcall(function() return prompt.Parent end) then Steal.Data[prompt] = nil end
	if not Steal.Data[prompt] then
		Steal.Data[prompt] = {hold = {}, trigger = {}, ready = true}
		pcall(function()
			if getconnections then
				for _, c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do
					if c.Function then table.insert(Steal.Data[prompt].hold, c.Function) end
				end
				for _, c in ipairs(getconnections(prompt.Triggered)) do
					if c.Function then table.insert(Steal.Data[prompt].trigger, c.Function) end
				end
			else
				Steal.Data[prompt].useFallback = true
			end
		end)
	end
	local data = Steal.Data[prompt]; if not data.ready then return end
	data.ready = false; isStealing = true; stealStartTime = ct; lastStealTick = ct
	resetProgressBar()
	if Conns.progress then Conns.progress:Disconnect(); Conns.progress = nil end
	Conns.progress = RunService.Heartbeat:Connect(function()
		if not isStealing then
			if Conns.progress then Conns.progress:Disconnect(); Conns.progress = nil end
			return
		end
		local prog = math.clamp((tick() - stealStartTime) / Steal.StealDuration, 0, 1)
		if progressFill then progressFill.Size = UDim2.new(prog, 0, 1, 0) end
		if progressPct then progressPct.Text = math.floor(prog * 100) .. "%" end
	end)
	task.spawn(function()
		local ok = false
		pcall(function()
			if not data.useFallback then
				for _, fn in ipairs(data.hold) do task.spawn(fn) end
				task.wait(Steal.StealDuration)
				for _, fn in ipairs(data.trigger) do task.spawn(fn) end
				ok = true
			end
		end)
		if not ok and fireproximityprompt then
			pcall(function() fireproximityprompt(prompt); ok = true end)
		end
		if not ok then
			pcall(function() prompt:InputHoldBegin(); task.wait(Steal.StealDuration); prompt:InputHoldEnd() end)
		end
		task.wait(Steal.StealDuration * 0.3)
		if Conns.progress then Conns.progress:Disconnect() end
		resetProgressBar(); task.wait(0.05); data.ready = true; isStealing = false
	end)
end

local function startAutoSteal()
	if Conns.autoSteal then return end
	Conns.autoSteal = RunService.Heartbeat:Connect(function()
		if not Steal.AutoStealEnabled or isStealing then return end
		local p = findNearestPrompt(); if p then executeSteal(p) end
	end)
end

local function stopAutoSteal()
	if Conns.autoSteal then Conns.autoSteal:Disconnect(); Conns.autoSteal = nil end
	isStealing = false; lastStealTick = 0
	Steal.plotCache = {}; Steal.plotCacheTime = {}; Steal.cachedPrompts = {}; resetProgressBar()
end

-- ===================== SPEED LOOP =====================
local speedLabel = nil
RunService.RenderStepped:Connect(function(dt)
	local char = LP.Character; if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
	if speedLabel then
		speedLabel.Text = string.format("%.0f", Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z).Magnitude)
	end
	local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
	if antiRagdollEnabled then
		local st = hum:GetState()
		if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown then
			for _, obj in ipairs(char:GetDescendants()) do
				if obj:IsA("Motor6D") and not obj.Enabled then obj.Enabled = true end
			end
			pcall(function() hum:ChangeState(Enum.HumanoidStateType.Running) end)
			hrp.AssemblyLinearVelocity = Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
			hrp.AssemblyAngularVelocity = Vector3.zero
			return
		end
	end
	if autoPlayEnabled or autoBatEnabled then return end
	local md = hum.MoveDirection
	local spd
	if laggerMode then spd = LAGGER_SPEED
	elseif speedMode then spd = CARRY_SPEED
	else spd = NORMAL_SPEED end
	if hum.WalkSpeed ~= spd then hum.WalkSpeed = spd end
	if md.Magnitude > 0.1 then
		local curX = hrp.AssemblyLinearVelocity.X
		local curZ = hrp.AssemblyLinearVelocity.Z
		local tgtX = md.X * spd
		local tgtZ = md.Z * spd
		local alpha = math.min(1, dt * 18)
		hrp.AssemblyLinearVelocity = Vector3.new(
			curX + (tgtX - curX) * alpha,
			hrp.AssemblyLinearVelocity.Y,
			curZ + (tgtZ - curZ) * alpha
		)
	end
end)

UIS.JumpRequest:Connect(function() if floatEnabled then floatJumping = true end end)

-- ===================== CHARACTER SETUP =====================
local function setupChar(char)
	task.wait(0.3)
	unwalkAnimations = {}
	local head = char:WaitForChild("Head", 5)
	if head then
		local old = head:FindFirstChild("VeltrixSpeedBB"); if old then old:Destroy() end
		local bb = Instance.new("BillboardGui", head)
		bb.Name = "VeltrixSpeedBB"; bb.Size = UDim2.new(0,80,0,20)
		bb.StudsOffset = Vector3.new(0,3.2,0); bb.AlwaysOnTop = true
		speedLabel = Instance.new("TextLabel", bb)
		speedLabel.Size = UDim2.new(1,0,1,0); speedLabel.BackgroundTransparency = 1
		speedLabel.Text = "0"; speedLabel.TextColor3 = Color3.fromRGB(120,210,255)
		speedLabel.Font = Enum.Font.GothamBlack; speedLabel.TextScaled = true
		speedLabel.TextStrokeTransparency = 0.4; speedLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
	end
	if antiRagdollEnabled and not Conns.antiRag then startAntiRagdoll() end
	if medusaCounterEnabled then setupMedusa(char) end
	if unwalkEnabled then task.wait(0.5); disableAnimations(); startUnwalkLoop() end
	if batRevengeEnabled then
		if batRevengeStateConn then batRevengeStateConn:Disconnect(); batRevengeStateConn = nil end
		startBatRevenge()
	end
	if noCollisionEnabled then startNoCollision() end
end

LP.CharacterAdded:Connect(setupChar)
if LP.Character then task.spawn(function() setupChar(LP.Character) end) end

-- ===================== GUI CLEANUP =====================
for _, n in pairs({"VeltrixDuelsGUI","VeltrixHubGUI","EnvyHubGUI"}) do
	pcall(function() local o = game:GetService("CoreGui"):FindFirstChild(n); if o then o:Destroy() end end)
	local pg2 = LP:FindFirstChild("PlayerGui")
	if pg2 then local o = pg2:FindFirstChild(n); if o then o:Destroy() end end
end

-- ===================== COLOR PALETTE =====================
local BG        = Color3.fromRGB(6, 7, 20)
local BG2       = Color3.fromRGB(9, 11, 28)
local TOPBAR_BG = Color3.fromRGB(7, 9, 24)
local CARD_BG   = Color3.fromRGB(11, 14, 35)
local CARD_HOV  = Color3.fromRGB(17, 22, 52)
local CARD_ACT  = Color3.fromRGB(14, 18, 44)
local BORDER    = Color3.fromRGB(28, 38, 88)
local BORDER2   = Color3.fromRGB(45, 75, 165)
local BORDER_HL = Color3.fromRGB(80, 140, 255)
local WHITE     = Color3.fromRGB(210, 225, 255)
local DIM       = Color3.fromRGB(90, 115, 170)
local DIM2      = Color3.fromRGB(60, 80, 130)
local ACCENT    = Color3.fromRGB(70, 160, 255)
local ACCENT2   = Color3.fromRGB(110, 80, 255)
local ACCENT3   = Color3.fromRGB(0, 220, 180)
local DARK_ACC  = Color3.fromRGB(25, 55, 130)
local OFF_BG    = Color3.fromRGB(10, 13, 32)
local ON_COL    = Color3.fromRGB(60, 155, 255)
local ON_DRK    = Color3.fromRGB(20, 60, 130)
local LAGGER_COL = Color3.fromRGB(255, 140, 40)
local LAGGER_DRK = Color3.fromRGB(110, 50, 8)
local DANGER    = Color3.fromRGB(255, 70, 90)

local ACTIVE_TAB_BG  = Color3.fromRGB(18, 50, 130)
local ACTIVE_TAB_TXT = Color3.fromRGB(130, 200, 255)
local IDLE_TAB_BG    = Color3.fromRGB(8, 10, 26)
local IDLE_TAB_TXT   = DIM

local mobBtnRefs = {}
local mobileButtons = {}

local syncNormalInput, syncCarryInput
local _updateTopBarNormal, _updateTopBarCarry
local stealDurationBox, stealRadiusBtn

-- ===================== SAVE CONFIG =====================m
local _lastSavedConfig = ""
local function saveConfig()
	local function ks(e) return {kb = e.kb and e.kb.Name or nil, gp = e.gp and e.gp.Name or nil} end
	local cfg = {
		normalSpeed = NORMAL_SPEED, carrySpeed = CARRY_SPEED,
		laggerSpeed = LAGGER_SPEED, laggerSlowSpeed = LAGGER_SLOW,
		dropBrainrotKey = ks(KB.DropBrainrot), autoPlayKey = ks(KB.AutoPlay),
		autoBatKey = ks(KB.AutoBat),
		guiHideKey = ks(KB.GuiHide), floatKey = ks(KB.Float),
		speedToggleKey = ks(KB.SpeedToggle), tpDownKey = ks(KB.TPDown),
		laggerToggleKey = ks(KB.LaggerToggle), batRevengeKey = ks(KB.BatRevenge),
		tauntKey = ks(KB.Taunt),
		laggerMode = laggerMode, grabRadius = Steal.StealRadius,
		stealDuration = Steal.StealDuration, antiRagdoll = antiRagdollEnabled,
		autoStealEnabled = Steal.AutoStealEnabled, infiniteJump = infJumpEnabled,
		medusaCounter = medusaCounterEnabled, carryMode = speedMode,
		autoBat = autoBatEnabled, unwalkEnabled = unwalkEnabled,
		floatHeight = floatHeight, floatEnabled = floatEnabled,
		stretchRez = stretchRezEnabled, noCollision = noCollisionEnabled,
		batRevenge = batRevengeEnabled, desync = desyncEnabled,
		jumpBoost = jumpBoost,
		batEngageRange = BAT_ENGAGE_DIST,
		batSpeed = BAT_SPEED,
		batSwingCooldown = BAT_SWING_COOLDOWN,
		aimbotShiftLock = aimbotShiftLock,
		autoPlayDirection = autoPlayDirection,
	}
	local btnPositions = {}
	for i, btn in ipairs(mobileButtons) do
		btnPositions[i] = {
			xScale = btn.Position.X.Scale, xOffset = btn.Position.X.Offset,
			yScale = btn.Position.Y.Scale, yOffset = btn.Position.Y.Offset,
		}
	end
	cfg.mobileButtonPositions = btnPositions
	local encoded = HttpService:JSONEncode(cfg)
	if encoded ~= _lastSavedConfig then
		_lastSavedConfig = encoded
		if writefile then pcall(function() writefile("VeltrixHubConfig.json", encoded) end) end
	end
end
task.spawn(function() while task.wait(5) do saveConfig() end end)

-- ===================== GLITCH EFFECT & SOUND =====================
local function playGlitchSound()
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://9127246548"
	sound.Volume = 0.6
	sound.PlaybackSpeed = 1.2
	sound.Parent = game:GetService("SoundService")
	sound:Play()
	game:GetService("Debris"):AddItem(sound, 2)
	task.delay(0.03, function()
		local s2 = sound:Clone(); s2.PlaybackSpeed = 0.9; s2.Volume = 0.5; s2.Parent = game:GetService("SoundService"); s2:Play()
		game:GetService("Debris"):AddItem(s2, 2)
	end)
end

local function applyGlitchEffectToFrame(frame)
	local originalPos = frame.Position
	local originalSize = frame.Size
	local originalRotation = frame.Rotation
	local shaket = 0
	local shakeConn = RunService.RenderStepped:Connect(function(dt)
		shaket = shaket + dt
		if shaket > 0.35 then
			shakeConn:Disconnect()
			frame.Position = originalPos
			frame.Size = originalSize
			frame.Rotation = originalRotation
			return
		end
		local offX = math.random(-8,8)
		local offY = math.random(-6,6)
		frame.Position = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + offX, originalPos.Y.Scale, originalPos.Y.Offset + offY)
		frame.Rotation = math.random(-5,5)
		frame.Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset + math.random(-2,2), originalSize.Y.Scale, originalSize.Y.Offset + math.random(-2,2))
	end)
	task.delay(0.35, function()
		if shakeConn then shakeConn:Disconnect() end
		frame.Position = originalPos
		frame.Size = originalSize
		frame.Rotation = originalRotation
	end)
end

-- ===================== GUI BUILD =====================
local function buildGUI()

local _apDirBtn = nil
local _apDirMenu = nil
local _apStatusLbl = nil
local _apTitleLbl = nil
local _apStroke = nil
local _apBtn = nil

local gui = Instance.new("ScreenGui")
gui.Name = "VeltrixHubGUI"
gui.ResetOnSpawn = false
gui.DisplayOrder =... (84 KB left)
