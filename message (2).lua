--[[
    Luа Ѕсrірt Deоbfuѕсаteԁ Bу LеаkD
    https://discord.gg/AwGHNh7Z7T
]]

local players, coreGui, statsService, runService, userInputService, tweenService, lighting,
  httpService, localPlayer, normalSpeed, carrySpeed, laggerSpeed, laggerCarrySpeed, v1, v2, v3,
  lower, v4, laggerCarryMode, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, antiLag,
  v17, v18, v19, v20, autoTPHeight, v21, scHeadless, scKorblox, scOutfit, v22, scAnimPackActive,
  v24, v43, vector, vector2, vector3, vector4, v44, v45, v46, v47, v48, v56, vector5, v58, v60,
  v77, v78, v89, connect, v90, connect2, v106, f51, v121, v130

players = game:GetService("Players")

coreGui = game:GetService("CoreGui")
statsService = game:GetService("Stats")
runService = game:GetService("RunService")
userInputService = game:GetService("UserInputService")
tweenService = game:GetService("TweenService")
lighting = game:GetService("Lighting")
httpService = game:GetService("HttpService")
localPlayer = players.LocalPlayer
task.spawn(function() end)
normalSpeed = 60
carrySpeed = 30
laggerSpeed = 15
laggerCarrySpeed = 24.5
v1 = false
v2 = false
v3 = false
lower = "manual"
v4 = false
laggerCarryMode = 0
v5 = false
v6 = false
v7 = false
v8 = false
v9 = 0
v10 = false
v11 = false
v12 = false
v13 = false
v14 = true
v15 = false
v16 = 0
antiLag = false
v17 = false
v18 = false
v19 = false
v20 = false
autoTPHeight = 20
v21 = false
scHeadless = false
scKorblox = false
scOutfit = "Default"
v22 = "Adidas Sports"
scAnimPackActive = false
local v23 = setmetatable({}, { __mode = "k" })
local count = 0

v24 = {
  ["Adidas Sports"] = {
    WalkAnim = 18537392113,
    RunAnim = 18537384940,
    JumpAnim = 18537380791,
    FallAnim = 18537367238,
    SwimIdle = 18537387180,
    Swim = 18537389531,
    Animation1 = 18537376492,
    Animation2 = 18537371272,
    ClimbAnim = 18537363391,
  },
  ["Adidas Community"] = {
    WalkAnim = 122150855457010,
    RunAnim = 82598234841035,
    JumpAnim = 75290611992385,
    FallAnim = 98600215928904,
    SwimIdle = 109346520324160,
    Swim = 133308483266210,
    Animation1 = 122257458498464,
    Animation2 = 102357151005770,
    ClimbAnim = 88763136693023,
  },
  ["Adidas Aura"] = {
    WalkAnim = 83842218823011,
    RunAnim = 118320322718870,
    JumpAnim = 109996626521200,
    FallAnim = 95603166884636,
    SwimIdle = 94922130551805,
    Swim = 134530128383900,
    Animation1 = 110211186840350,
    Animation2 = 114191137265065,
    ClimbAnim = 97824616490448,
  },
  ["Wicked Popular"] = {
    WalkAnim = 92072849924640,
    RunAnim = 72301599441680,
    JumpAnim = 104325245285198,
    FallAnim = 121152442762480,
    Animation1 = 118832222982050,
    ClimbAnim = 131326830509780,
    SwimIdle = 113199415118199,
    Swim = 99384245425157,
    Animation2 = 76049494037641,
  },
  Elder = {
    WalkAnim = 10921111375,
    RunAnim = 10921104374,
    JumpAnim = 10921107367,
    FallAnim = 10921105765,
    SwimIdle = 10921110146,
    Swim = 10921108971,
    ClimbAnim = 10921100400,
    Animation1 = 10921101664,
    Animation2 = 10921102574,
  },
  Zombie = {
    WalkAnim = 10921355261,
    RunAnim = 616163682,
    JumpAnim = 10921351278,
    FallAnim = 10921350320,
    SwimIdle = 10921353442,
    Swim = 10921352344,
    Animation1 = 10921344533,
    Animation2 = 10921345304,
    ClimbAnim = 10921343576,
  },
  Mage = {
    WalkAnim = 10921152678,
    RunAnim = 10921148209,
    JumpAnim = 10921149743,
    FallAnim = 10921148939,
    SwimIdle = 10921151661,
    Swim = 10921150788,
    ClimbAnim = 10921143404,
    Animation1 = 10921144709,
    Animation2 = 10921145797,
  },
  ["Catwalk Glam"] = {
    WalkAnim = 109168724482750,
    RunAnim = 81024476153754,
    JumpAnim = 116936326516980,
    FallAnim = 92294537340807,
    SwimIdle = 98854111361360,
    Swim = 134591743181630,
    ClimbAnim = 119377220967554,
    Animation1 = 133806214992290,
    Animation2 = 94970088341563,
  },
  Astronaut = {
    WalkAnim = 10921046031,
    RunAnim = 10921039308,
    JumpAnim = 10921042494,
    FallAnim = 10921040576,
    SwimIdle = 10921045006,
    Swim = 10921044000,
    ClimbAnim = 10921032124,
    Animation1 = 10921034824,
    Animation2 = 10921036806,
  },
  ['Wicked "Dancing Through Life"'] = {
    WalkAnim = 73718308412641,
    RunAnim = 135515454877970,
    JumpAnim = 78508480717326,
    FallAnim = 78147885297412,
    SwimIdle = 129183123083280,
    Swim = 110657013921770,
    ClimbAnim = 129447497744820,
    Animation1 = 92849173543269,
    Animation2 = 132238900951110,
  },
  Werewolf = {
    WalkAnim = 10921342074,
    RunAnim = 10921336997,
    JumpAnim = 10921339758,
    FallAnim = 10921337907,
    SwimIdle = 10921341319,
    Swim = 10921340419,
    ClimbAnim = 10921329322,
    Animation1 = 10921330408,
    Animation2 = 10921333667,
  },
  Superhero = {
    WalkAnim = 10921298616,
    RunAnim = 10921291831,
    JumpAnim = 10921294559,
    FallAnim = 10921293373,
    SwimIdle = 10921297391,
    Swim = 10921295495,
    ClimbAnim = 10921286911,
    Animation1 = 10921288909,
    Animation2 = 10921290167,
  },
  Toy = {
    WalkAnim = 10921312010,
    RunAnim = 10921306285,
    JumpAnim = 10921308158,
    FallAnim = 10921307241,
    SwimIdle = 10921310341,
    Swim = 10921309319,
    ClimbAnim = 10921300839,
    Animation1 = 10921301576,
  },
  ["No Boundaries"] = {
    WalkAnim = 18747074203,
    RunAnim = 18747070484,
    JumpAnim = 18747069148,
    FallAnim = 18747062535,
    SwimIdle = 18747071682,
    Swim = 18747073181,
    ClimbAnim = 18747060903,
    Animation1 = 18747067405,
    Animation2 = 18747063918,
  },
  NFL = {
    WalkAnim = 110358958299420,
    RunAnim = 117333533048078,
    JumpAnim = 119846112151350,
    FallAnim = 129773241321030,
    SwimIdle = 79090109939093,
    Swim = 132697394189920,
    ClimbAnim = 134630013742019,
    Animation1 = 92080889861410,
    Animation2 = 74451233229259,
  },
  ["Amazon Unboxed"] = {
    WalkAnim = 90478085024465,
    RunAnim = 134824450619860,
    JumpAnim = 121454505477205,
    FallAnim = 94788218468396,
    SwimIdle = 129126268464850,
    Swim = 105962919001090,
    ClimbAnim = 121145883950230,
    Animation1 = 98281136301627,
  },
  Vampire = {
    WalkAnim = 10921326949,
    RunAnim = 10921320299,
    JumpAnim = 10921322186,
    FallAnim = 10921321317,
    SwimIdle = 10921325443,
    Swim = 10921324408,
    ClimbAnim = 10921314188,
    Animation1 = 10921315373,
  },
  Ninja = {
    Run = 656118852,
    Walk = 656121766,
    Jump = 656117878,
    Fall = 656115606,
    Swim = 656119721,
    SwimIdle = 656121397,
    Climb = 656114359,
    Idle = { 656117400, 656118341, 886742569 },
  },
  Robot = {
    Run = 616091570,
    Walk = 616095330,
    Jump = 616090535,
    Fall = 616087089,
    Swim = 616092998,
    SwimIdle = 616094091,
    Climb = 616086039,
    Idle = { 616088211, 616089559, 885531463 },
  },
  Levitation = {
    Run = 616010382,
    Walk = 616013216,
    Jump = 616008936,
    Fall = 616005863,
    Swim = 616011509,
    SwimIdle = 616012453,
    Climb = 616003713,
    Idle = { 616006778, 616008087, 886862142 },
  },
  Stylish = {
    Run = 616140816,
    Walk = 616146177,
    Jump = 616139451,
    Fall = 616134815,
    Swim = 616143378,
    SwimIdle = 616144772,
    Climb = 616133594,
    Idle = { 616136790, 616138447, 886888594 },
  },
  Bubbly = {
    Run = 910025107,
    Walk = 910034870,
    Jump = 910016857,
    Fall = 910001910,
    Swim = 910028158,
    SwimIdle = 910030921,
    Climb = 909997997,
    Idle = { 910004836, 910009958, 1018536639 },
  },
  Cartoon = {
    Run = 742638842,
    Walk = 742640026,
    Jump = 742637942,
    Fall = 742637151,
    Swim = 742639220,
    SwimIdle = 742639812,
    Climb = 742636889,
    Idle = { 742637544, 742638445, 885477856 },
  },
}

local function f1(p1, p2)
  if not p1 then
    return nil
  else
    local findFirstChild = p1:FindFirstChild(p2)

    if not findFirstChild then
      findFirstChild = Instance.new("Animation")
      findFirstChild.Name = p2
      findFirstChild.Parent = p1
    end

    return findFirstChild
  end
end

local v25 = {
  ["Outfit 1"] = { shirt = "rbxassetid://11814874288", pants = "rbxassetid://77686770169224" },
  ["Outfit 2"] = { shirt = "rbxassetid://7791905291", pants = "rbxassetid://84715951225041" },
  ["Outfit 3"] = { shirt = "rbxassetid://136747635179752", pants = "rbxassetid://4620736485" },
}

local function f2(p3, ...)
  for i = 1, select("#", ...) do
    local v26 = p3[select(i, ...)]

    if v26 ~= nil then
      return v26
    end
  end

  return nil
end

local function f3(p4, p5)
  local humanoid = p4 and p4:FindFirstChildOfClass("Humanoid")

  if not humanoid then
    return
  else
    local v27 = v23[p4] or {}
    v23[p4] = v27

    if humanoid.RigType == Enum.HumanoidRigType.R6 then
      local rightLeg = p4:FindFirstChild("Right Leg")

      if not rightLeg then
        return
      end

      if p5 then
        if not v27.r6LegColor then
          v27.r6LegColor = rightLeg.Color
          v27.r6Meshes = {}

          for index, value in ipairs(rightLeg:GetChildren()) do
            if value:IsA("SpecialMesh") or value:IsA("CharacterMesh") then
              table.insert(v27.r6Meshes, value:Clone())
              value:Destroy()
            end
          end
        end

        rightLeg.Color = Color3.fromRGB(64, 64, 64)
        local mwVaneSCKorbloxMesh = rightLeg:FindFirstChild("MwVaneSCKorbloxMesh")

        if mwVaneSCKorbloxMesh then
          mwVaneSCKorbloxMesh:Destroy()
        end

        local mwVaneSCKorbloxMesh2 = Instance.new("SpecialMesh", rightLeg)
        mwVaneSCKorbloxMesh2.Name = "MwVaneSCKorbloxMesh"
        mwVaneSCKorbloxMesh2.MeshType = Enum.MeshType.FileMesh
        mwVaneSCKorbloxMesh2.MeshId = "rbxassetid://101851696"
        mwVaneSCKorbloxMesh2.TextureId = "rbxassetid://101851254"
      else
        local mwVaneSCKorbloxMesh3 = rightLeg:FindFirstChild("MwVaneSCKorbloxMesh")

        if mwVaneSCKorbloxMesh3 then
          mwVaneSCKorbloxMesh3:Destroy()
        end

        if v27.r6LegColor then
          rightLeg.Color = v27.r6LegColor
        end

        if v27.r6Meshes then
          for index2, value2 in ipairs(v27.r6Meshes) do
            value2:Clone().Parent = rightLeg
          end
        end

        v27.r6LegColor = nil
        v27.r6Meshes = nil
      end

      return
    else
      local rightUpperLeg = p4:FindFirstChild("RightUpperLeg")
      local rightLowerLeg = p4:FindFirstChild("RightLowerLeg")
      local rightFoot = p4:FindFirstChild("RightFoot")

      if not rightUpperLeg then
        return
      end

      if p5 then
        if not v27.r15Transparency then
          v27.r15Transparency = {
            rightUpperLeg.Transparency, rightLowerLeg and rightLowerLeg.Transparency or 0,
            rightFoot and rightFoot.Transparency or 0,
          }
        end

        rightUpperLeg.Transparency = 1

        if rightLowerLeg then
          rightLowerLeg.Transparency = 1
        end

        if rightFoot then
          rightFoot.Transparency = 1
        end

        local mwVaneSCKorbloxLeg = p4:FindFirstChild("MwVaneSCKorbloxLeg")

        if mwVaneSCKorbloxLeg then
          mwVaneSCKorbloxLeg:Destroy()
        end

        local mwVaneSCKorbloxLeg2 = Instance.new("Part", p4)
        mwVaneSCKorbloxLeg2.Name = "MwVaneSCKorbloxLeg"
        mwVaneSCKorbloxLeg2.Size = Vector3.new(1, 2, 1)
        mwVaneSCKorbloxLeg2.Anchored = false
        mwVaneSCKorbloxLeg2.CanCollide = false
        mwVaneSCKorbloxLeg2.Massless = true
        mwVaneSCKorbloxLeg2.Color = Color3.fromRGB(64, 64, 64)

        local instance = Instance.new("SpecialMesh", mwVaneSCKorbloxLeg2)
        instance.MeshType = Enum.MeshType.FileMesh
        instance.MeshId = "rbxassetid://101851696"
        instance.TextureId = "rbxassetid://101851254"

        local mwVaneSCKorbloxWeld = Instance.new("Weld", mwVaneSCKorbloxLeg2)
        mwVaneSCKorbloxWeld.Name = "MwVaneSCKorbloxWeld"
        mwVaneSCKorbloxWeld.Part0 = rightUpperLeg
        mwVaneSCKorbloxWeld.Part1 = mwVaneSCKorbloxLeg2
        mwVaneSCKorbloxWeld.C0 = CFrame.new(0, -0.8, 0)
      else
        local r15Transparency = v27.r15Transparency

        if r15Transparency then
          rightUpperLeg.Transparency = r15Transparency[1]

          if rightLowerLeg then
            rightLowerLeg.Transparency = r15Transparency[2]
          end

          if rightFoot then
            rightFoot.Transparency = r15Transparency[3]
          end
        end

        local mwVaneSCKorbloxLeg3 = p4:FindFirstChild("MwVaneSCKorbloxLeg")

        if mwVaneSCKorbloxLeg3 then
          mwVaneSCKorbloxLeg3:Destroy()
        end

        v27.r15Transparency = nil
      end

      return
    end
  end
end

local function f4(p6, p7)
  local head = p6 and p6:FindFirstChild("Head")

  if not head then
    return
  else
    local v28 = v23[p6] or {}
    v23[p6] = v28

    if p7 then
      if v28.headTransparency == nil then
        v28.headTransparency = head.Transparency
        v28.headCanCollide = head.CanCollide

        local face = head:FindFirstChild("face")
        v28.face = face and face:Clone() or nil
      end

      head.Transparency = 1
      head.CanCollide = false

      local face2 = head:FindFirstChild("face")

      if face2 then
        face2:Destroy()
      end

      local mwVaneSCHeadlessMesh = head:FindFirstChild("MwVaneSCHeadlessMesh")

      if mwVaneSCHeadlessMesh then
        mwVaneSCHeadlessMesh:Destroy()
      end

      local mwVaneSCHeadlessMesh2 = Instance.new("SpecialMesh", head)
      mwVaneSCHeadlessMesh2.Name = "MwVaneSCHeadlessMesh"
      mwVaneSCHeadlessMesh2.MeshType = Enum.MeshType.FileMesh
      mwVaneSCHeadlessMesh2.MeshId = "rbxassetid://1095708"
      mwVaneSCHeadlessMesh2.Scale = Vector3.new(0.001, 0.001, 0.001)
    else
      local mwVaneSCHeadlessMesh3 = head:FindFirstChild("MwVaneSCHeadlessMesh")

      if mwVaneSCHeadlessMesh3 then
        mwVaneSCHeadlessMesh3:Destroy()
      end

      if v28.headTransparency ~= nil then
        head.Transparency = v28.headTransparency
        head.CanCollide = v28.headCanCollide

        if v28.face and not head:FindFirstChild("face") then
          local face3 = v28.face
          face3:Clone().Parent = head
        end

        v28.headTransparency = nil
        v28.headCanCollide = nil
        v28.face = nil
      end
    end

    return
  end
end

local function f5(p8, p9)
  local v29 = v24[p8]
  local v30, v31, animate, f6, mwVaneSCReload

  if not v29 then
    return false
  else
    count = count + 1
    local v32 = count
    local character = p9 or localPlayer.Character

    if not character then
      return false
    else
      animate = nil
      local v33 = nil

      for j = 1, 40 do
        animate = character:FindFirstChild("Animate")

        if animate and animate:FindFirstChild("idle") and animate:FindFirstChild("run")
          and animate:FindFirstChild("walk") then
          v33 = true
          break
        end

        task.wait(0.1)
      end

      if not v33 or v32 ~= count then
        return false
      else
        local humanoid2 = character:FindFirstChildOfClass("Humanoid")

        local animator = humanoid2
        animator = humanoid2 and humanoid2:FindFirstChildOfClass("Animator")

        local localScript = animate:IsA("LocalScript")

        local v34 = localScript
        v34 = localScript or animate:IsA("Script")

        if v34 then
          pcall(function() animate.Disabled = true end)
        end

        runService.Heartbeat:Wait()

        for index3, value3 in ipairs(animator and animator:GetPlayingAnimationTracks()
          or humanoid2 and humanoid2:GetPlayingAnimationTracks() or {}) do
          local v35 = value3

          if v35.Priority == Enum.AnimationPriority.Core
            or v35.Priority == Enum.AnimationPriority.Idle
            or v35.Priority == Enum.AnimationPriority.Movement then
            pcall(function() v35:Stop(0.12) end)
          end
        end

        function f6(p10)
          if not p10 then
            return nil
          else
            local d = tostring(p10):match("%d+")
            return d and "rbxassetid://" .. d or nil
          end
        end

        local function f7(p11, p12, p13)
          local v36 = f1(animate:FindFirstChild(p11), p12)
          local v37 = f6(p13)

          if v36 and v37 and v36.AnimationId ~= v37 then
            v36.AnimationId = v37
          end
        end

        f7("walk", "WalkAnim", f2(v29, "WalkAnim", "Walk"))
        f7("run", "RunAnim", f2(v29, "RunAnim", "Run"))
        f7("jump", "JumpAnim", f2(v29, "JumpAnim", "Jump"))
        f7("fall", "FallAnim", f2(v29, "FallAnim", "Fall"))
        f7("climb", "ClimbAnim", f2(v29, "ClimbAnim", "Climb"))
        f7("swim", "Swim", f2(v29, "Swim"))
        f7("swimidle", "SwimIdle", f2(v29, "SwimIdle") or f2(v29, "Swim"))

        local idle = animate:FindFirstChild("idle")

        if idle then
          local idle2 = v29.Idle or { f2(v29, "Animation1"), f2(v29, "Animation2") }

          if idle2[1] or idle2[2] then
            local v38 = idle2[1] or idle2[2]
            local v39 = idle2[2] or idle2[1]
            local v40 = f1(idle, "Animation1")
            local v41 = f1(idle, "Animation2")

            if v40 then
              v40.AnimationId = f6(v38)
            end

            if v41 then
              v41.AnimationId = f6(v39)
            end

            for index4, value4 in ipairs(idle:GetChildren()) do
              if value4:IsA("Animation") and value4 ~= v40 and value4 ~= v41 then
                value4:Destroy()
              end
            end

            if v40 and not v40:FindFirstChild("Weight") then
              local weight = Instance.new("NumberValue", v40)
              weight.Name = "Weight"
              weight.Value = 9
            end

            if v41 and not v41:FindFirstChild("Weight") then
              local weight2 = Instance.new("NumberValue", v41)
              weight2.Name = "Weight"
              weight2.Value = 1
            end
          end
        end

        runService.Heartbeat:Wait()

        if v32 ~= count or not animate.Parent then
          return false
        end

        if v34 then
          mwVaneSCReload = nil
          pcall(function() mwVaneSCReload = animate:Clone() end)

          if mwVaneSCReload then
            mwVaneSCReload.Name = "MwVaneSCReload"
            mwVaneSCReload.Disabled = true
            mwVaneSCReload.Parent = character

            animate:Destroy()
            mwVaneSCReload.Name = "Animate"
            animate = mwVaneSCReload
            runService.Heartbeat:Wait()

            if v32 ~= count or not animate.Parent then
              return false
            end

            animate.Disabled = false
          else
            pcall(function() animate.Disabled = false end)
          end

          runService.Heartbeat:Wait()
          v30 = v32 == count

          v31 = v30
          v31 = v30 and v22 == p8

          if v31 then
            scAnimPackActive = true
          end

          return v31
        end

        runService.Heartbeat:Wait()
        v30 = v32 == count

        v31 = v30
        v31 = v30 and v22 == p8

        if v31 then
          scAnimPackActive = true
        end

        return v31
      end
    end
  end
end

local function f8(p14, p15)
  if not p14 then
    return
  else
    for index5, value5 in ipairs(p14:GetChildren()) do
      if value5:IsA("Accessory")
        and (value5.Name == "MwVaneSCFit1Hair" or value5.Name == "MwVaneSCFitHeadAcc") then
        value5:Destroy()
      end
    end

    local v42 = v25[p15]

    if not v42 then
      f4(p14, false)
      local mwVaneSCShirt = p14:FindFirstChild("MwVaneSCShirt")

      if mwVaneSCShirt then
        mwVaneSCShirt:Destroy()
      end

      local mwVaneSCPants = p14:FindFirstChild("MwVaneSCPants")

      if mwVaneSCPants then
        mwVaneSCPants:Destroy()
      end

      return
    else
      f4(p14, true)
      local mwVaneSCShirt2 = p14:FindFirstChildOfClass("Shirt")

      if not mwVaneSCShirt2 then
        mwVaneSCShirt2 = Instance.new("Shirt", p14)
        mwVaneSCShirt2.Name = "MwVaneSCShirt"
      end

      mwVaneSCShirt2.ShirtTemplate = v42.shirt
      local mwVaneSCPants2 = p14:FindFirstChildOfClass("Pants")

      if not mwVaneSCPants2 then
        mwVaneSCPants2 = Instance.new("Pants", p14)
        mwVaneSCPants2.Name = "MwVaneSCPants"
      end

      mwVaneSCPants2.PantsTemplate = v42.pants

      if p15 == "Outfit 1" then
        pcall(function()
          local mwVaneSCFit1Hair = Instance.new("Accessory", p14)
          mwVaneSCFit1Hair.Name = "MwVaneSCFit1Hair"

          local handle = Instance.new("Part", mwVaneSCFit1Hair)
          handle.Name = "Handle"
          handle.Size = Vector3.new(2, 2, 2)
          handle.CanCollide = false

          local instance2 = Instance.new("SpecialMesh", handle)
          instance2.MeshType = Enum.MeshType.FileMesh
          instance2.MeshId = "rbxassetid://78289009309744"
          instance2.TextureId = "rbxassetid://78289009309744"
          instance2.Scale = Vector3.new(1.25, 1.25, 1.25)

          local instance3 = Instance.new("Weld", handle)
          local head2 = p14:FindFirstChild("Head")

          if head2 then
            instance3.Part0 = head2
            instance3.Part1 = handle
            instance3.C0 = CFrame.new(0, 0.2, -0.1)
          end
        end)
      end

      return
    end
  end
end

local function f9(p16)
  task.wait(0.3)
  f4(p16, scHeadless)
  f3(p16, scKorblox)
  f8(p16, scOutfit)

  if scAnimPackActive and v22 and v24[v22] then
    task.spawn(function()
      task.wait(0.3)
      f5(v22, p16)
    end)
  end
end

do
  v43 = {
    DropBrainrot = { kb = Enum.KeyCode.X, gp = nil },
    AutoLeft = { kb = Enum.KeyCode.Z, gp = nil },
    AutoRight = { kb = Enum.KeyCode.C, gp = nil },
    AutoBat = { kb = Enum.KeyCode.E, gp = nil },
    TPBat = { kb = Enum.KeyCode.V, gp = nil },
    TPFloor = { kb = Enum.KeyCode.F, gp = nil },
    GuiHide = { kb = Enum.KeyCode.LeftControl, gp = nil },
    SpeedToggle = { kb = Enum.KeyCode.Q, gp = nil },
    LaggerToggle = { kb = Enum.KeyCode.R, gp = nil },
  }

  function _G.updateKeybind(p17, kb)
    if v43[p17] then
      v43[p17].kb = kb

      task.spawn(function()
        task.wait(0.1)

        if _G._saveConfig then
          _G._saveConfig()
        end
      end)

      return true
    end

    return false
  end

  vector = Vector3.new(-476.47, -6.28, 92.73)
  vector2 = Vector3.new(-483.12, -4.95, 94.81)
  vector3 = Vector3.new(-476.16, -6.52, 25.62)
  vector4 = Vector3.new(-483.06, -5.03, 25.48)

  v44 = {
    AutoStealEnabled = false,
    StealMode = "Normal",
    STEAL_HOLD_MIN = 1.3,
    STEAL_HOLD_MAX = 2.6,
    STEAL_ENTRY_DELAY = 0.3,
    STEAL_PRIME_RANGE = 80,
    Data = {},
    Modes = {
      Normal = { StealRadius = 60, StealDuration = 1.4 },
      Semi = { StealRadius = 9, StealDuration = 1.1 },
    },
  }

  local function f10()
    return v44.Modes[v44.StealMode] or v44.Modes.Normal
  end

  function v44:getRadius()
    return f10().StealRadius
  end

  function v44:getDuration()
    return f10().StealDuration
  end

  function v44:setMode(p18)
    if v44.Modes[p18] then
      v44.StealMode = p18
    end
  end

  v45 = false
end

do
  v46 = {}

  v47 = {
    active = false,
    startTime = 0,
    phase = "idle",
    label = "IDLE",
    lastResult = "",
    lastResultTime = 0,
  }

  v48 = {
    autoSteal = nil,
    antiRag = nil,
    batCounter = nil,
    anchor = {},
    progress = nil,
    esp = {},
    mwvaneTPBat = nil,
  }

  _G.mwvaneTPBatToggled = false
  _G.mwvaneTPBatHittingCooldown = false

  local g = _G
  g.MWVANE_TP_BAT_RANGE = _G.MWVANE_TP_BAT_RANGE or _G.CANDY_TP_BAT_RANGE or 100
end

local function f11()
  if v48.antiRag then
    v48.antiRag:Disconnect()
    v48.antiRag = nil
  end
end

do
  local function f12()
    local character2 = localPlayer.Character

    if not character2 then
      return nil
    else
      local humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")

      if not humanoidRootPart then
        return nil
      else
        local mwvaneTPBATRANGE = _G.MWVANE_TP_BAT_RANGE
        local v49 = nil

        for key, value6 in pairs(players:GetPlayers()) do
          if value6 ~= localPlayer and value6.Character then
            local humanoidRootPart2 = value6.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart2 then
              local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

              if magnitude < mwvaneTPBATRANGE then
                mwvaneTPBATRANGE = magnitude
                v49 = value6
              end
            end
          end
        end

        return v49
      end
    end
  end

  local function f13()
    local character3 = localPlayer.Character

    if not character3 then
      return nil
    else
      local bat = character3:FindFirstChild("Bat")

      if bat then
        return bat
      else
        local backpack = localPlayer:FindFirstChild("Backpack")

        if backpack then
          local bat2 = backpack:FindFirstChild("Bat")

          if bat2 then
            bat2.Parent = character3
            return bat2
          end

          return nil
        end

        return nil
      end
    end
  end

  local function f14()
    if _G.mwvaneTPBatHittingCooldown then
      return
    end

    _G.mwvaneTPBatHittingCooldown = true

    pcall(function()
      local v50 = f13()

      if v50 then
        v50:Activate()
        local remoteEvent = v50:FindFirstChildWhichIsA("RemoteEvent")

        if remoteEvent then
          remoteEvent:FireServer()
        end
      end
    end)

    task.delay(0.08, function() _G.mwvaneTPBatHittingCooldown = false end)
  end

  function _G.startMwVaneTPBat()
    if v48.mwvaneTPBat then
      return
    end

    v48.mwvaneTPBat = runService.Heartbeat:Connect(function()
      local getPlayingAnimationTracks

      if not _G.mwvaneTPBatToggled then
        return
      else
        local character4 = localPlayer.Character

        if not character4 then
          return
        else
          local humanoidRootPart3 = character4:FindFirstChild("HumanoidRootPart")
          local v51 = not humanoidRootPart3
          local humanoid3 = character4:FindFirstChildOfClass("Humanoid")

          if v51 or not humanoid3 then
            return
          else
            local animator2 = humanoid3:FindFirstChildOfClass("Animator")

            if animator2 then
              getPlayingAnimationTracks = animator2:GetPlayingAnimationTracks()
              local v52 = #getPlayingAnimationTracks - -1

              while true do
                v52 = -1 + v52

                if not (v52 >= 1 or false) then
                  break
                end

                local v53 = v52
                pcall(function() getPlayingAnimationTracks[v53]:Stop() end)
              end
            end

            local v54 = f12()

            if v54 and v54.Character then
              local humanoidRootPart4 = v54.Character:FindFirstChild("HumanoidRootPart")

              if humanoidRootPart4 then
                if sethiddenproperty then
                  pcall(
                    sethiddenproperty, humanoidRootPart3, "PhysicsRepRootPart",
                    humanoidRootPart4
                  )
                end

                local v55 = humanoidRootPart4.Position + Vector3.new(0, 0.9, 0)

                if (humanoidRootPart3.Position - v55).Magnitude > 8 then
                  humanoidRootPart3.CFrame = CFrame.new(v55)
                end

                local currentCamera = workspace.CurrentCamera

                if currentCamera then
                  currentCamera.CFrame = CFrame.new(
                    currentCamera.CFrame.Position, humanoidRootPart4.Position
                  )
                end

                f14()
              end
            end

            for index6, value7 in ipairs(character4:GetDescendants()) do
              if value7:IsA("BasePart") then
                value7.CanCollide = false
              end
            end

            return
          end
        end
      end
    end)
  end

  function _G.stopMwVaneTPBat()
    if v48.mwvaneTPBat then
      v48.mwvaneTPBat:Disconnect()
      v48.mwvaneTPBat = nil
    end

    if localPlayer.Character then
      localPlayer.Character:FindFirstChild("HumanoidRootPart")
    end
  end

  _G.getClosestMwVaneTP = f12
  _G.tryHitMwVaneTP = f14

  v56 = false
  vector5 = Vector3.new(0, 0, 0)
end

local function f15()
  if v48.antiRag then
    return
  end

  v48.antiRag = runService.Heartbeat:Connect(function()
    if not v2 then
      return
    else
      local character5 = localPlayer.Character

      if not character5 then
        return
      else
        local humanoid4 = character5:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart5 = character5:FindFirstChild("HumanoidRootPart")

        if not (humanoid4 and humanoidRootPart5) then
          return
        else
          local getState = humanoid4:GetState()

          local v57 = getState == Enum.HumanoidStateType.Physics
            or getState == Enum.HumanoidStateType.Ragdoll
            or getState == Enum.HumanoidStateType.FallingDown

          local ragdollEndTime = localPlayer:GetAttribute("RagdollEndTime")

          if ragdollEndTime and ragdollEndTime - workspace:GetServerTimeNow() > 0 then
            v57 = true
          end

          if v57 then
            pcall(function()
              localPlayer:SetAttribute("RagdollEndTime", workspace:GetServerTimeNow())
            end)

            for index7, value8 in ipairs(character5:GetDescendants()) do
              if value8:IsA("BallSocketConstraint")
                or value8:IsA("Attachment") and value8.Name:find("RagdollAttachment") then
                value8:Destroy()
              end
            end

            for index8, value9 in ipairs(character5:GetDescendants()) do
              if value9:IsA("Motor6D") and value9.Enabled == false then
                value9.Enabled = true
              end
            end

            if humanoid4.Health > 0 then
              humanoid4:ChangeState(Enum.HumanoidStateType.Running)
            end

            workspace.CurrentCamera.CameraSubject = humanoid4

            humanoidRootPart5.Anchored = false
            humanoidRootPart5.AssemblyLinearVelocity = Vector3.zero
            humanoidRootPart5.AssemblyAngularVelocity = Vector3.zero
          end

          return
        end
      end
    end
  end)
end

v58 = {
  [Enum.KeyCode.W] = true,
  [Enum.KeyCode.A] = true,
  [Enum.KeyCode.S] = true,
  [Enum.KeyCode.D] = true,
  [Enum.KeyCode.Up] = true,
  [Enum.KeyCode.Left] = true,
  [Enum.KeyCode.Down] = true,
  [Enum.KeyCode.Right] = true,
}

local v59 = {}

local function f16(p19)
  v59 = {}

  if not p19 then
    return
  else
    local waitForChild = p19:WaitForChild("HumanoidRootPart", 5)

    if waitForChild then
      v59[waitForChild] = true
    end

    return waitForChild
  end
end

local function f17()
  return v4 and (laggerCarryMode == 2 and laggerCarrySpeed or laggerSpeed) or v1 and carrySpeed
    or normalSpeed
end

local function f18()
  return v4 and laggerSpeed or normalSpeed
end

local instance4

local function f19(p20)
  local waitForChild2 = p20:WaitForChild("Head", 5)

  if not waitForChild2 then
    return
  else
    local instance5 = Instance.new("BillboardGui", waitForChild2)
    instance5.Size = UDim2.new(0, 160, 0, 60)
    instance5.StudsOffset = Vector3.new(0, 3, 0)
    instance5.AlwaysOnTop = true

    instance4 = Instance.new("TextLabel", instance5)
    instance4.Size = UDim2.new(1, 0, 0.56, 0)
    instance4.BackgroundTransparency = 1
    instance4.Text = "Speed: 0"
    instance4.TextColor3 = Color3.fromRGB(40, 200, 90)
    instance4.Font = Enum.Font.GothamBold
    instance4.TextScaled = true
    instance4.TextStrokeTransparency = 0
    instance4.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    local instance6 = Instance.new("TextLabel", instance5)
    instance6.Size = UDim2.new(1, 0, 0.38, 0)
    instance6.Position = UDim2.new(0, 0, 0.58, 0)
    instance6.BackgroundTransparency = 1
    instance6.Text = "discord.gg/mwvanehub"
    instance6.TextColor3 = Color3.fromRGB(40, 200, 90)
    instance6.Font = Enum.Font.GothamBold
    instance6.TextScaled = true
    instance6.TextStrokeTransparency = 0
    instance6.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    return
  end
end

v60 = {}

local function f20(p21)
  local v61 = not p21 or v60[p21]
  local v62

  if v61 then
    return
  else
    v60[p21] = true
    local v63 = getrawmetatable(p21)

    if not v63 then
      return
    end

    setreadonly(v63, false)
    v62 = rawget(v63, "__index")

    v63.__index = newcclosure(function(p22, p23)
      if not checkcaller() and v59[p22]
        and (p23 == "AssemblyLinearVelocity" or p23 == "Velocity") then
        local v64 = nil

        if type(v62) == "function" then
          v64 = v62(p22, p23)
        elseif type(v62) == "table" then
          v64 = v62[p23]
        end

        if v64.Magnitude > 20 then
          return v64.Unit * 20
        end

        return v64
      elseif type(v62) == "function" then
        return v62(p22, p23)
      else
        if type(v62) == "table" then
          return v62[p23]
        end

        return
      end
    end)

    setreadonly(v63, true)
    return
  end
end

local function f21(p24)
  if not p24 then
    return false
  else
    local getState2 = p24:GetState()

    return p24.PlatformStand or getState2 == Enum.HumanoidStateType.Physics
      or getState2 == Enum.HumanoidStateType.Ragdoll
      or getState2 == Enum.HumanoidStateType.FallingDown
  end
end

local function f22(p25, p26)
  if not p25 or not p25.Parent then
    return
  else
    local assemblyMass = p25.AssemblyMass

    if assemblyMass and assemblyMass > 0 then
      p25:ApplyImpulse((p26 - p25.AssemblyLinearVelocity) * assemblyMass)
    else
      p25.AssemblyLinearVelocity = p26
    end

    return
  end
end

local function f23(p27, p28)
  local character6 = localPlayer.Character
  local humanoid5 = character6 and character6:FindFirstChildOfClass("Humanoid")
  local humanoidRootPart6 = character6 and character6:FindFirstChild("HumanoidRootPart")

  if not character6 or not humanoid5 or not humanoidRootPart6 or humanoid5.Health <= 0 then
    return
  end

  if p27 and p27.Magnitude > 0.05 then
    pcall(function()
      if humanoidRootPart6.SetNetworkOwner then
        humanoidRootPart6:SetNetworkOwner(localPlayer)
      end
    end)

    local unit = p27.Unit

    f22(
      humanoidRootPart6,
      Vector3.new(unit.X * p28, humanoidRootPart6.AssemblyLinearVelocity.Y, unit.Z * p28)
    )
  else
    f22(humanoidRootPart6, Vector3.new(0, humanoidRootPart6.AssemblyLinearVelocity.Y, 0))
  end
end

task.spawn(function()
  while task.wait(0.1) do
    pcall(function()
      for index9, value10 in ipairs(players:GetPlayers()) do
        local v65 = value10

        if v65 ~= localPlayer and v65.Character then
          if v65.Character:FindFirstChildOfClass("Humanoid") then
            if _G.espEnabled or _G.lineEspEnabled then
              local humanoidRootPart7 = v65.Character:FindFirstChild("HumanoidRootPart")

              if humanoidRootPart7 then
                if not v48.esp[v65] then
                  v48.esp[v65] = {}
                end

                if _G.espEnabled and not v48.esp[v65].box then
                  local billboardGui = Instance.new("BillboardGui")
                  billboardGui.Name = "ESP_" .. v65.Name
                  billboardGui.AlwaysOnTop = true
                  billboardGui.Size = UDim2.new(4, 0, 5.5, 0)
                  billboardGui.Adornee = humanoidRootPart7

                  local instance7 = Instance.new("Frame", billboardGui)
                  instance7.Size = UDim2.new(1, 0, 1, 0)
                  instance7.BackgroundTransparency = 1

                  local instance8 = Instance.new("UIStroke", instance7)
                  instance8.Color = Color3.fromRGB(255, 255, 255)
                  instance8.Thickness = 1.5

                  local instance9 = Instance.new("TextLabel", billboardGui)
                  instance9.Size = UDim2.new(1, 0, 0, 20)
                  instance9.Position = UDim2.new(0, 0, 0, -25)
                  instance9.BackgroundTransparency = 1
                  instance9.TextColor3 = Color3.fromRGB(255, 255, 255)
                  instance9.Font = Enum.Font.GothamBold
                  instance9.TextSize = 12
                  instance9.Text = v65.Name
                  instance9.TextStrokeTransparency = 0.5

                  local playerGui = localPlayer:FindFirstChild("PlayerGui")

                  if playerGui then
                    billboardGui.Parent = playerGui
                  end

                  v48.esp[v65].box = billboardGui
                elseif not _G.espEnabled and v48.esp[v65].box then
                  pcall(function() v48.esp[v65].box:Destroy() end)
                  v48.esp[v65].box = nil
                end

                if _G.lineEspEnabled and not v48.esp[v65].line then
                  local line = Drawing.new("Line")
                  line.Visible = true
                  line.To = Vector2.new(0, 0)
                  line.Color = Color3.fromRGB(255, 255, 255)
                  line.Thickness = 1.5
                  line.Transparency = 0.7

                  v48.esp[v65].line = line
                elseif not _G.lineEspEnabled and v48.esp[v65].line then
                  pcall(function() v48.esp[v65].line:Remove() end)
                  v48.esp[v65].line = nil
                end

                if v48.esp[v65].line then
                  local character7 = localPlayer.Character

                  local humanoidRootPart8 = character7

                  humanoidRootPart8 = character7
                    and character7:FindFirstChild("HumanoidRootPart")

                  local v66, v67 = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart7.Position)

                  if v67 and humanoidRootPart8 then
                    local worldToViewportPoint = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart8.Position)

                    v48.esp[v65].line.Visible = true

                    v48.esp[v65].line.From = Vector2.new(
                      worldToViewportPoint.X, worldToViewportPoint.Y
                    )

                    v48.esp[v65].line.To = Vector2.new(v66.X, v66.Y)
                  else
                    v48.esp[v65].line.Visible = false
                  end
                end
              end
            end
          end
        end
      end

      for key2, value11 in pairs(v48.esp) do
        local v68 = value11

        if not (key2.Parent and key2.Character and (_G.espEnabled or _G.lineEspEnabled)) then
          if v68.box then
            pcall(function() v68.box:Destroy() end)
          end

          if v68.line then
            pcall(function() v68.line:Remove() end)
          end

          v48.esp[key2] = nil
        end
      end
    end)
  end
end)

local f24

local function f25()
  local character8 = localPlayer.Character

  if not character8 then
    return nil
  else
    local humanoidRootPart9 = character8:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart9 then
      return nil
    else
      local plots = workspace:FindFirstChild("Plots")

      if not plots then
        return nil
      else
        local huge = math.huge
        local v69 = nil

        local stealPRIMERANGE = v44.StealMode == "Semi" and v44.STEAL_PRIME_RANGE
          or v44:getRadius()

        for index10, value12 in ipairs(plots:GetChildren()) do
          if f24(value12.Name) then
          else
            local animalPodiums = value12:FindFirstChild("AnimalPodiums")

            if not animalPodiums then
            else
              for index11, value13 in ipairs(animalPodiums:GetChildren()) do
                local base = value13:FindFirstChild("Base")

                local v70 = base
                v70 = base and base:FindFirstChild("Spawn")

                if v70 then
                  local magnitude2 = (v70.Position - humanoidRootPart9.Position).Magnitude

                  if magnitude2 <= stealPRIMERANGE and magnitude2 < huge then
                    local promptAttachment = v70:FindFirstChild("PromptAttachment")

                    if promptAttachment then
                      for index12, value14 in ipairs(promptAttachment:GetChildren()) do
                        if value14:IsA("ProximityPrompt") and value14.ActionText:find("Steal") then
                          huge = magnitude2
                          v69 = value14
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end

        return v69
      end
    end
  end
end

local function f26(p29)
  local v71 = v46[p29]

  if not v71 or not v71.ready then
    return false
  end

  if #v71.holdCallbacks == 0 and #v71.triggerCallbacks == 0 then
    return false
  end

  v71.ready = false
  v45 = true

  v47.active = true
  v47.startTime = tick()
  v47.phase = "normal"
  v47.label = "Normal"

  task.spawn(function()
    for index13, value15 in ipairs(v71.holdCallbacks) do
      task.spawn(value15)
    end

    local total = 0

    while true do
      if not (total < v44:getDuration()) then
        break
      end

      total = total + task.wait()
    end

    for index14, value16 in ipairs(v71.triggerCallbacks) do
      task.spawn(value16)
    end

    task.wait(0.01)

    v47.active = false
    v47.phase = "idle"
    v47.lastResult = "Stole"
    v47.lastResultTime = tick()

    v71.ready = true
    v45 = false
  end)

  return true
end

function f24(p30)
  local plots2 = workspace:FindFirstChild("Plots")

  if not plots2 then
    return false
  else
    local findFirstChild2 = plots2:FindFirstChild(p30)

    if not findFirstChild2 then
      return false
    else
      local plotSign = findFirstChild2:FindFirstChild("PlotSign")

      if plotSign then
        local yourBase = plotSign:FindFirstChild("YourBase")

        if yourBase and yourBase:IsA("BillboardGui") then
          return yourBase.Enabled == true
        end

        return false
      end

      return false
    end
  end
end

local f27

local function f28()
  if v48.autoSteal then
    v48.autoSteal:Disconnect()
    v48.autoSteal = nil
  end

  if v48.progress then
    v48.progress:Disconnect()
    v48.progress = nil
  end

  v45 = false
  f27()
end

local function f29(p31)
  if v46[p31] then
    return
  else
    local v72 = { holdCallbacks = {}, triggerCallbacks = {}, ready = true }
    local v73, v74 = pcall(getconnections, p31.PromptButtonHoldBegan)

    if v73 and type(v74) == "table" then
      for index15, value17 in ipairs(v74) do
        if type(value17.Function) == "function" then
          table.insert(v72.holdCallbacks, value17.Function)
        end
      end
    end

    local v75, v76 = pcall(getconnections, p31.Triggered)

    if v75 and type(v76) == "table" then
      for index16, value18 in ipairs(v76) do
        if type(value18.Function) == "function" then
          table.insert(v72.triggerCallbacks, value18.Function)
        end
      end
    end

    if #v72.holdCallbacks > 0 or #v72.triggerCallbacks > 0 then
      v46[p31] = v72
    end

    return
  end
end

function f27()
  if v78 then
    v78.Text = "0%"
  end

  if v77 then
    v77.Size = UDim2.new(0, 0, 1, 0)
  end
end

local f30

local function f31(p32)
  local v79 = v46[p32]

  if not v79 or not v79.ready then
    return false
  end

  if #v79.holdCallbacks == 0 and #v79.triggerCallbacks == 0 then
    return false
  end

  v79.ready = false
  v45 = true

  v47.active = true
  v47.startTime = tick()
  v47.phase = "holding"
  v47.label = "Holding"

  task.spawn(function()
    for index17, value19 in ipairs(v79.holdCallbacks) do
      task.spawn(value19)
    end

    task.wait(v44.STEAL_HOLD_MIN)

    v47.phase = "waitingRange"
    v47.label = "Waiting"

    local v80 = f30(p32) <= v44:getRadius()
    local v81 = false

    while not (tick() - v47.startTime > v44.STEAL_HOLD_MAX) do
      if not p32.Parent then
        break
      end

      if f30(p32) <= v44:getRadius() then
        if not v80 then
          task.wait(v44.STEAL_ENTRY_DELAY)
        end

        for index18, value20 in ipairs(v79.triggerCallbacks) do
          task.spawn(value20)
        end

        v81 = true
        v47.label = "Stealing"
        break
      end

      task.wait()
    end

    v47.active = false
    v47.phase = "idle"

    if v81 then
      v47.lastResult = "Stole"
    else
      v47.lastResult = "Missed"
    end

    v47.lastResultTime = tick()
    task.wait(v44:getDuration() * 0.1)
    v79.ready = true
    v45 = false
  end)

  return true
end

function f30(p33)
  local character9 = localPlayer.Character

  if not character9 then
    return math.huge
  else
    local humanoidRootPart10 = character9:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart10 then
      return math.huge
    else
      local parent = p33.Parent

      if not parent or not parent:IsA("Attachment") then
        return math.huge
      else
        local parent2 = parent.Parent

        if not parent2 or parent2.Name ~= "Spawn" then
          return math.huge
        end

        return (humanoidRootPart10.Position - parent2.Position).Magnitude
      end
    end
  end
end

local function f32()
  if v48.autoSteal then
    return
  end

  v48.autoSteal = runService.Heartbeat:Connect(function()
    if not v44.AutoStealEnabled or v45 then
      return
    else
      local v82 = f25()

      if v82 then
        f29(v82)

        if v44.StealMode == "Semi" then
          f31(v82)
        else
          f26(v82)
        end
      end

      return
    end
  end)
end

runService.Stepped:Connect(function()
  for index19, value21 in ipairs(players:GetPlayers()) do
    if value21 ~= localPlayer and value21.Character then
      for index20, value22 in ipairs(value21.Character:GetDescendants()) do
        if value22:IsA("BasePart") then
          value22.CanCollide = false
        end
      end
    end
  end
end)

local function f33(p34)
  if not v3 then
    return
  else
    local character10 = localPlayer.Character

    if not character10 then
      return
    else
      local humanoidRootPart11 = character10:FindFirstChild("HumanoidRootPart")

      if humanoidRootPart11 then
        humanoidRootPart11.Velocity = Vector3.new(
          humanoidRootPart11.Velocity.X, p34, humanoidRootPart11.Velocity.Z
        )
      end

      return
    end
  end
end

runService.RenderStepped:Connect(function(delta)
  local character11 = localPlayer.Character

  if not character11 then
    return
  else
    local humanoid6 = character11:FindFirstChildOfClass("Humanoid")
    local v83 = not humanoid6
    local humanoidRootPart12 = character11:FindFirstChild("HumanoidRootPart")

    if v83 or not humanoidRootPart12 then
      return
    elseif f21(humanoid6) then
      vector5 = Vector3.new(0, 0, 0)
      return
    else
      if not v13 and not v11 and not v12 then
        local moveDirection = humanoid6.MoveDirection
        local v84 = f17()
        local v85 = nil

        if moveDirection.Magnitude > 0 then
          vector5 = moveDirection
          v85 = moveDirection
        elseif v2 and vector5.Magnitude > 0 then
          local v86 = false

          for key3 in pairs(v58) do
            if userInputService:IsKeyDown(key3) then
              v86 = true
              break
            end
          end

          if v86 then
            v85 = vector5
          end
        end

        f23(v85, v84)
      end

      if instance4 then
        instance4.Text = string.format("Speed: %.1f", Vector3.new(
          humanoidRootPart12.AssemblyLinearVelocity.X, 0,
          humanoidRootPart12.AssemblyLinearVelocity.Z
        ).Magnitude)
      end

      return
    end
  end
end)

local v87 = 1
local v88 = 1

local function f34()
  if connect then
    connect:Disconnect()
    connect = nil
  end

  v88 = 1
  local character12 = localPlayer.Character

  if character12 then
    local humanoid7 = character12:FindFirstChildOfClass("Humanoid")

    if humanoid7 then
      humanoid7:Move(Vector3.zero, false)
    end
  end

  if v89 then
    v89(false)
  end
end

local function f35()
  if connect2 then
    connect2:Disconnect()
    connect2 = nil
  end

  v87 = 1
  local character13 = localPlayer.Character

  if character13 then
    local humanoid8 = character13:FindFirstChildOfClass("Humanoid")

    if humanoid8 then
      humanoid8:Move(Vector3.zero, false)
    end
  end

  if v90 then
    v90(false)
  end
end

local function f36()
  if connect2 then
    connect2:Disconnect()
  end

  v87 = 1

  connect2 = runService.Heartbeat:Connect(function()
    if not v11 then
      return
    else
      local character14 = localPlayer.Character

      if not character14 then
        return
      else
        local humanoidRootPart13 = character14:FindFirstChild("HumanoidRootPart")
        local humanoid9 = character14:FindFirstChildOfClass("Humanoid")

        if not humanoidRootPart13 or not humanoid9 then
          return
        elseif f21(humanoid9) then
          humanoid9:Move(Vector3.zero, false)
          return
        else
          local v91 = f18()

          if v87 == 1 then
            if (Vector3.new(vector.X, humanoidRootPart13.Position.Y, vector.Z)
                - humanoidRootPart13.Position).Magnitude
              < 1 then
              v87 = 2
              local v92 = vector2 - humanoidRootPart13.Position
              local unit2 = Vector3.new(v92.X, 0, v92.Z).Unit
              humanoid9:Move(unit2, false)

              humanoidRootPart13.AssemblyLinearVelocity = Vector3.new(
                unit2.X * v91, humanoidRootPart13.AssemblyLinearVelocity.Y, unit2.Z * v91
              )

              return
            end

            local v93 = vector - humanoidRootPart13.Position
            local unit3 = Vector3.new(v93.X, 0, v93.Z).Unit
            humanoid9:Move(unit3, false)

            humanoidRootPart13.AssemblyLinearVelocity = Vector3.new(
              unit3.X * v91, humanoidRootPart13.AssemblyLinearVelocity.Y, unit3.Z * v91
            )

            return
          elseif v87 == 2 then
            if (Vector3.new(vector2.X, humanoidRootPart13.Position.Y, vector2.Z)
                - humanoidRootPart13.Position).Magnitude
              < 1 then
              humanoid9:Move(Vector3.zero, false)
              humanoidRootPart13.AssemblyLinearVelocity = Vector3.zero
              v11 = false

              if connect2 then
                connect2:Disconnect()
                connect2 = nil
              end

              v87 = 1

              if v90 then
                v90(false)
              end

              return
            else
              local v94 = vector2 - humanoidRootPart13.Position
              local unit4 = Vector3.new(v94.X, 0, v94.Z).Unit
              humanoid9:Move(unit4, false)

              humanoidRootPart13.AssemblyLinearVelocity = Vector3.new(
                unit4.X * v91, humanoidRootPart13.AssemblyLinearVelocity.Y, unit4.Z * v91
              )

              return
            end
          else
            return
          end
        end
      end
    end
  end)
end

local function f37()
  if connect then
    connect:Disconnect()
  end

  v88 = 1

  connect = runService.Heartbeat:Connect(function()
    if not v12 then
      return
    else
      local character15 = localPlayer.Character

      if not character15 then
        return
      else
        local humanoidRootPart14 = character15:FindFirstChild("HumanoidRootPart")
        local humanoid10 = character15:FindFirstChildOfClass("Humanoid")

        if not humanoidRootPart14 or not humanoid10 then
          return
        elseif f21(humanoid10) then
          humanoid10:Move(Vector3.zero, false)
          return
        else
          local v95 = f18()

          if v88 == 1 then
            if (Vector3.new(vector3.X, humanoidRootPart14.Position.Y, vector3.Z)
                - humanoidRootPart14.Position).Magnitude
              < 1 then
              v88 = 2
              local v96 = vector4 - humanoidRootPart14.Position
              local unit5 = Vector3.new(v96.X, 0, v96.Z).Unit
              humanoid10:Move(unit5, false)

              humanoidRootPart14.AssemblyLinearVelocity = Vector3.new(
                unit5.X * v95, humanoidRootPart14.AssemblyLinearVelocity.Y, unit5.Z * v95
              )

              return
            end

            local v97 = vector3 - humanoidRootPart14.Position
            local unit6 = Vector3.new(v97.X, 0, v97.Z).Unit
            humanoid10:Move(unit6, false)

            humanoidRootPart14.AssemblyLinearVelocity = Vector3.new(
              unit6.X * v95, humanoidRootPart14.AssemblyLinearVelocity.Y, unit6.Z * v95
            )

            return
          elseif v88 == 2 then
            if (Vector3.new(vector4.X, humanoidRootPart14.Position.Y, vector4.Z)
                - humanoidRootPart14.Position).Magnitude
              < 1 then
              humanoid10:Move(Vector3.zero, false)
              humanoidRootPart14.AssemblyLinearVelocity = Vector3.zero
              v12 = false

              if connect then
                connect:Disconnect()
                connect = nil
              end

              v88 = 1

              if v89 then
                v89(false)
              end

              return
            else
              local v98 = vector4 - humanoidRootPart14.Position
              local unit7 = Vector3.new(v98.X, 0, v98.Z).Unit
              humanoid10:Move(unit7, false)

              humanoidRootPart14.AssemblyLinearVelocity = Vector3.new(
                unit7.X * v95, humanoidRootPart14.AssemblyLinearVelocity.Y, unit7.Z * v95
              )

              return
            end
          else
            return
          end
        end
      end
    end
  end)
end

do
  local v99 = false
  local v100 = false

  userInputService.JumpRequest:Connect(function()
    if not v3 or lower ~= "manual" then
      return
    else
      local character16 = localPlayer.Character

      if not character16 then
        return
      else
        local humanoidRootPart15 = character16:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart15 then
          humanoidRootPart15.Velocity = Vector3.new(
            humanoidRootPart15.Velocity.X, 55, humanoidRootPart15.Velocity.Z
          )
        end

        return
      end
    end
  end)

  userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard
      and input.KeyCode == Enum.KeyCode.Space and not userInputService:GetFocusedTextBox() then
      v99 = true

      task.delay(0.12, function()
        if v99 then
          v100 = true
          f33(50)
        end
      end)
    end
  end)

  userInputService.InputEnded:Connect(function(input2)
    if input2.UserInputType == Enum.UserInputType.Keyboard
      and input2.KeyCode == Enum.KeyCode.Space then
      v99 = false
      v100 = false
    end
  end)

  runService.Heartbeat:Connect(function()
    if v3 and lower == "hold" then
      local character17 = localPlayer.Character

      if not character17 then
        return
      else
        local humanoidRootPart16 = character17:FindFirstChild("HumanoidRootPart")
        local v101 = not humanoidRootPart16
        local humanoid11 = character17:FindFirstChildOfClass("Humanoid")

        if v101 or not humanoid11 then
          return
        end

        if (userInputService:IsKeyDown(Enum.KeyCode.Space)
            or userInputService:IsKeyDown(Enum.KeyCode.ButtonA) or humanoid11.Jump)
          and humanoidRootPart16.Velocity.Y < 38 then
          humanoidRootPart16.Velocity = Vector3.new(
            humanoidRootPart16.Velocity.X, 38, humanoidRootPart16.Velocity.Z
          )
        end

        return
      end
    elseif v100 then
      f33(50)
    end
  end)
end

local clone

local function f38()
  local character18 = localPlayer.Character

  if not character18 then
    return
  else
    local humanoid12 = character18:FindFirstChildOfClass("Humanoid")

    if humanoid12 then
      for index21, value23 in ipairs(humanoid12:GetPlayingAnimationTracks()) do
        value23:Stop()
      end
    end

    local animate2 = character18:FindFirstChild("Animate")

    if animate2 then
      local destroy = animate2.Destroy
      clone = animate2:Clone()
      destroy(animate2)
    end

    return
  end
end

local function f39()
  local character19 = localPlayer.Character

  if character19 and clone then
    local v102 = clone
    v102:Clone().Parent = character19
    clone = nil
  end
end

local v103

local function f40(p35)
  if not v103 then
    return
  else
    local animate3 = p35:FindFirstChild("Animate")

    if not animate3 then
      return
    else
      local function f41(p36, p37)
        if p36 and p37 then
          p36.AnimationId = p37
        end
      end

      f41(animate3.idle and animate3.idle.Animation1, v103.idle1)
      f41(animate3.idle and animate3.idle.Animation2, v103.idle2)
      f41(animate3.walk and animate3.walk.WalkAnim, v103.walk)
      f41(animate3.run and animate3.run.RunAnim, v103.run)
      f41(animate3.jump and animate3.jump.JumpAnim, v103.jump)
      f41(animate3.fall and animate3.fall.FallAnim, v103.fall)
      f41(animate3.climb and animate3.climb.ClimbAnim, v103.climb)
      f41(animate3.swim and animate3.swim.Swim, v103.swim)
      f41(animate3.swimidle and animate3.swimidle.SwimIdle, v103.swimidle)

      local humanoid13 = p35:FindFirstChildOfClass("Humanoid")

      if humanoid13 then
        for index22, value24 in ipairs(humanoid13:GetPlayingAnimationTracks()) do
          value24:Stop(0)
        end

        humanoid13:ChangeState(Enum.HumanoidStateType.Running)
      end

      return
    end
  end
end

local v104 = {
  idle1 = "rbxassetid://133806214992291",
  idle2 = "rbxassetid://94970088341563",
  walk = "rbxassetid://707897309",
  run = "rbxassetid://707861613",
  jump = "rbxassetid://116936326516985",
  fall = "rbxassetid://116936326516985",
  climb = "rbxassetid://116936326516985",
  swim = "rbxassetid://116936326516985",
  swimidle = "rbxassetid://116936326516985",
}

local f42

local function f43(p38)
  local animate4 = p38:FindFirstChild("Animate")

  if not animate4 then
    return
  else
    local function f44(p39)
      return p39 and p39.AnimationId or nil
    end

    local idle1 = f44(animate4.idle and animate4.idle.Animation1)

    local v105 = {
      idle1 = idle1,
      idle2 = f44(animate4.idle and animate4.idle.Animation2),
      walk = f44(animate4.walk and animate4.walk.WalkAnim),
      run = f44(animate4.run and animate4.run.RunAnim),
      jump = f44(animate4.jump and animate4.jump.JumpAnim),
      fall = f44(animate4.fall and animate4.fall.FallAnim),
      climb = f44(animate4.climb and animate4.climb.ClimbAnim),
      swim = f44(animate4.swim and animate4.swim.Swim),
      swimidle = f44(animate4.swimidle and animate4.swimidle.SwimIdle),
    }

    if not f42(v105.walk) then
      v103 = v105
    end

    return
  end
end

function f42(p40)
  if not p40 then
    return false
  end

  for key4, value25 in pairs(v104) do
    if value25 == p40 then
      return true
    end
  end

  return false
end

local function f45(p41)
  local animate5 = p41:FindFirstChild("Animate")

  if not animate5 then
    return
  else
    local function f46(p42, animationId)
      if p42 then
        p42.AnimationId = animationId
      end
    end

    f46(animate5.idle and animate5.idle.Animation1, "rbxassetid://133806214992291")
    f46(animate5.idle and animate5.idle.Animation2, "rbxassetid://94970088341563")
    f46(animate5.walk and animate5.walk.WalkAnim, "rbxassetid://707897309")
    f46(animate5.run and animate5.run.RunAnim, "rbxassetid://707861613")
    f46(animate5.jump and animate5.jump.JumpAnim, "rbxassetid://116936326516985")
    f46(animate5.fall and animate5.fall.FallAnim, "rbxassetid://116936326516985")
    f46(animate5.climb and animate5.climb.ClimbAnim, "rbxassetid://116936326516985")
    f46(animate5.swim and animate5.swim.Swim, "rbxassetid://116936326516985")
    f46(animate5.swimidle and animate5.swimidle.SwimIdle, "rbxassetid://116936326516985")

    return
  end
end

local function f47()
  local character20 = localPlayer.Character

  if character20 then
    f43(character20)
    f45(character20)
    local humanoid14 = character20:FindFirstChildOfClass("Humanoid")

    if humanoid14 then
      for index23, value26 in ipairs(humanoid14:GetPlayingAnimationTracks()) do
        value26:Stop(0)
      end

      humanoid14:ChangeState(Enum.HumanoidStateType.Running)
    end
  end
end

local function f48()
  local character21 = localPlayer.Character

  if character21 then
    f40(character21)
  end
end

local characterAdded = localPlayer.CharacterAdded
local connect3

local function f49()
  v17 = false

  if connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  workspace.CurrentCamera.FieldOfView = 70
end

local function f50()
  v17 = true
  workspace.CurrentCamera.FieldOfView = 107

  if connect3 then
    connect3:Disconnect()
  end

  connect3 = runService.RenderStepped:Connect(function()
    if not v17 then
      connect3:Disconnect()
      connect3 = nil
      return
    end

    workspace.CurrentCamera.FieldOfView = 107
  end)
end

characterAdded:Connect(function(p43)
  task.wait(0.3)
  v60 = {}
  f20((f16(p43)))

  if v18 then
    f43(p43)
    f45(p43)
  end

  f9(p43)
end)

local function f52()
  if v10 then
    return
  end

  local character22 = localPlayer.Character

  if not character22 then
    return
  end

  if not character22:FindFirstChild("HumanoidRootPart") then
    return
  end

  if v13 then
    v13 = false

    if f51 then
      f51()
    end

    if v106 then
      v106(false)
    end
  end

  v10 = true
  local v107 = tick()

  local connect4 = nil

  connect4 = runService.Heartbeat:Connect(function()
    local humanoidRootPart17 = character22 and character22:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart17 then
      connect4:Disconnect()
      v10 = false
      return
    end

    if tick() - v107 >= 0.2 then
      connect4:Disconnect()

      local raycastParams = RaycastParams.new()
      raycastParams.FilterDescendantsInstances = { character22 }
      raycastParams.FilterType = Enum.RaycastFilterType.Exclude

      local raycast = workspace:Raycast(
        humanoidRootPart17.Position, Vector3.new(0, -2000, 0), raycastParams
      )

      if raycast then
        local humanoid15 = character22:FindFirstChildOfClass("Humanoid")
        local hipHeight = humanoid15 and humanoid15.HipHeight or 2

        humanoidRootPart17.CFrame = CFrame.new(humanoidRootPart17.Position.X, raycast.Position.Y
          + (hipHeight + humanoidRootPart17.Size.Y / 2), humanoidRootPart17.Position.Z)

        humanoidRootPart17.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
      end

      v10 = false
      return
    end

    humanoidRootPart17.AssemblyLinearVelocity = Vector3.new(
      humanoidRootPart17.AssemblyLinearVelocity.X, 150,
      humanoidRootPart17.AssemblyLinearVelocity.Z
    )
  end)
end

local function f53(p44)
  local character23 = localPlayer.Character
  local v108

  if not character23 then
    return
  else
    local humanoidRootPart18 = character23:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart18 then
      return
    else
      local humanoid16 = character23:FindFirstChildOfClass("Humanoid")

      if not humanoid16 then
        return
      elseif not p44 then
        if humanoid16.FloorMaterial ~= Enum.Material.Air then
          return
        end

        if humanoidRootPart18.Position.Y < autoTPHeight then
          return
        end

        v108 = { humanoidRootPart18.CFrame:ToEulerAnglesYXZ() }

        humanoidRootPart18.CFrame = CFrame.new(
          humanoidRootPart18.Position.X, -7, humanoidRootPart18.Position.Z
        ) * CFrame.Angles(0, v108[2], 0)

        humanoidRootPart18.AssemblyLinearVelocity = Vector3.zero

        return
      else
        v108 = { humanoidRootPart18.CFrame:ToEulerAnglesYXZ() }

        humanoidRootPart18.CFrame = CFrame.new(
          humanoidRootPart18.Position.X, -7, humanoidRootPart18.Position.Z
        ) * CFrame.Angles(0, v108[2], 0)

        humanoidRootPart18.AssemblyLinearVelocity = Vector3.zero

        return
      end
    end
  end
end

local v109

local function f54()
  if v109 then
    task.cancel(v109)
    v109 = nil
  end

  v109 = task.spawn(function()
    while v20 do
      task.wait(0.1)
      pcall(function() f53(false) end)
    end
  end)
end

local function f55()
  v20 = false

  if v109 then
    task.cancel(v109)
    v109 = nil
  end
end

do
  local g2 = _G
  g2._CandyHubSkyMode = _G._CandyHubSkyMode or "Off"
end

local v110

local function f56()
  if v110 then
    return
  else
    v110 = {
      ClockTime = lighting.ClockTime,
      OutdoorAmbient = lighting.OutdoorAmbient,
      Ambient = lighting.Ambient,
      Brightness = lighting.Brightness,
      FogStart = lighting.FogStart,
      FogEnd = lighting.FogEnd,
      FogColor = lighting.FogColor,
      ColorShift_Top = lighting.ColorShift_Top,
      ColorShift_Bottom = lighting.ColorShift_Bottom,
      GeographicLatitude = lighting.GeographicLatitude,
      GlobalShadows = lighting.GlobalShadows,
      LightingChildren = {},
      TerrainChildren = {},
    }

    for index24, value27 in ipairs(lighting:GetChildren()) do
      if value27:IsA("Sky") or value27:IsA("Atmosphere") then
        table.insert(v110.LightingChildren, value27:Clone())
      end
    end

    local terrain = workspace:FindFirstChildOfClass("Terrain")

    if terrain then
      for index25, value28 in ipairs(terrain:GetChildren()) do
        if value28:IsA("Clouds") then
          table.insert(v110.TerrainChildren, value28:Clone())
        end
      end
    end

    return
  end
end

local function f57(p45, parent3, p46)
  local instance10 = Instance.new(p45)
  instance10:SetAttribute("CandyHubSkyTheme", true)

  for key5, value29 in pairs(p46 or {}) do
    local v111 = key5
    local v112 = value29
    pcall(function() instance10[v111] = v112 end)
  end

  instance10.Parent = parent3
  return instance10
end

local function f58(p47)
  for index26, value30 in ipairs(lighting:GetChildren()) do
    local v113 = value30

    if v113:GetAttribute("CandyHubSkyTheme")
      or p47 and (v113:IsA("Sky") or v113:IsA("Atmosphere")) then
      pcall(function() v113:Destroy() end)
    end
  end

  local terrain2 = workspace:FindFirstChildOfClass("Terrain")

  if terrain2 then
    for index27, value31 in ipairs(terrain2:GetChildren()) do
      local v114 = value31

      if v114:GetAttribute("CandyHubSkyTheme") or p47 and v114:IsA("Clouds") then
        pcall(function() v114:Destroy() end)
      end
    end
  end
end

local v115 = {
  Off = { kind = "off" },
  Night = {
    clock = 22,
    brightness = 2,
    ambient = { 110, 100, 130 },
    outAmb = { 120, 110, 140 },
    sky = {
      stars = 4000,
      moon = 18,
      sun = 0,
      moonTex = true,
    },
    atm = {
      dens = 0.45,
      color = { 120, 60, 180 },
      decay = { 60, 20, 100 },
      glare = 0.5,
      haze = 1.2,
    },
  },
  Aurora = {
    clock = 14,
    brightness = 3,
    ambient = { 150, 120, 150 },
    outAmb = { 160, 130, 160 },
    atm = {
      dens = 0.55,
      color = { 255, 80, 200 },
      decay = { 255, 20, 150 },
      glare = 2.5,
      haze = 3,
    },
    clouds = { cover = 0.7, dens = 0.7, color = { 255, 240, 250 } },
  },
  Sunset = {
    clock = 17.2,
    brightness = 2.5,
    ambient = { 170, 120, 100 },
    outAmb = { 180, 130, 110 },
    sky = { stars = 0, sun = 25, moon = 0 },
    atm = {
      dens = 0.5,
      color = { 255, 130, 60 },
      decay = { 255, 80, 30 },
      glare = 2,
      haze = 2.5,
    },
    clouds = { cover = 0.55, dens = 0.55, color = { 255, 200, 140 } },
  },
  Galaxy = {
    clock = 0,
    brightness = 1.5,
    ambient = { 70, 60, 100 },
    outAmb = { 80, 70, 110 },
    sky = { stars = 10000, moon = 30, sun = 0 },
    atm = {
      dens = 0.15,
      color = { 40, 20, 80 },
      decay = { 20, 10, 50 },
      glare = 0.3,
      haze = 0.5,
    },
  },
  Cyber = {
    clock = 21,
    brightness = 2.2,
    ambient = { 90, 130, 170 },
    outAmb = { 100, 140, 180 },
    sky = { stars = 2000, moon = 12 },
    atm = {
      dens = 0.4,
      color = { 0, 200, 255 },
      decay = { 150, 0, 255 },
      glare = 2,
      haze = 2,
    },
    clouds = { cover = 0.4, dens = 0.6, color = { 100, 200, 255 } },
  },
  Sakura = {
    clock = 11,
    brightness = 3.5,
    ambient = { 170, 150, 160 },
    outAmb = { 180, 160, 170 },
    sky = { sun = 8 },
    atm = {
      dens = 0.3,
      color = { 255, 200, 220 },
      decay = { 255, 170, 200 },
      glare = 1,
      haze = 1.5,
    },
    clouds = { cover = 0.6, dens = 0.4, color = { 255, 250, 252 } },
  },
  ["Pink Night"] = {
    clock = 23,
    brightness = 2.2,
    ambient = { 120, 60, 110 },
    outAmb = { 140, 70, 120 },
    sky = {
      stars = 5000,
      moon = 22,
      sun = 0,
      moonTex = true,
    },
    atm = {
      dens = 0.5,
      color = { 255, 80, 180 },
      decay = { 140, 30, 100 },
      glare = 0.7,
      haze = 1.4,
    },
    clouds = { cover = 0.3, dens = 0.5, color = { 180, 90, 150 } },
  },
  ["Blood Moon"] = {
    clock = 22.5,
    brightness = 1.6,
    ambient = { 130, 40, 40 },
    outAmb = { 150, 50, 50 },
    sky = {
      stars = 1500,
      moon = 28,
      sun = 0,
      moonTex = true,
    },
    atm = {
      dens = 0.6,
      color = { 220, 30, 30 },
      decay = { 120, 10, 10 },
      glare = 1.4,
      haze = 2,
    },
    clouds = { cover = 0.5, dens = 0.7, color = { 120, 30, 30 } },
  },
  ["Emerald Dawn"] = {
    clock = 6.5,
    brightness = 2.8,
    ambient = { 130, 170, 140 },
    outAmb = { 140, 180, 150 },
    sky = { sun = 18, moon = 0, stars = 0 },
    atm = {
      dens = 0.4,
      color = { 80, 200, 140 },
      decay = { 40, 150, 90 },
      glare = 1.8,
      haze = 2.2,
    },
    clouds = { cover = 0.5, dens = 0.5, color = { 200, 255, 220 } },
  },
  Volcanic = {
    clock = 19,
    brightness = 2,
    ambient = { 180, 80, 40 },
    outAmb = { 200, 90, 50 },
    sky = { stars = 200, sun = 12, moon = 0 },
    atm = {
      dens = 0.75,
      color = { 255, 60, 0 },
      decay = { 180, 20, 0 },
      glare = 3,
      haze = 3.5,
    },
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
    sky = {
      stars = 6000,
      moon = 24,
      sun = 0,
      moonTex = true,
    },
    atm = {
      dens = 0.5,
      color = { 20, 60, 140 },
      decay = { 10, 30, 90 },
      glare = 0.6,
      haze = 1.5,
    },
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
    atm = {
      dens = 0.55,
      color = { 100, 220, 40 },
      decay = { 60, 150, 20 },
      glare = 1.8,
      haze = 2.6,
    },
    clouds = { cover = 0.65, dens = 0.7, color = { 180, 255, 120 } },
  },
  ["Solar Eclipse"] = {
    clock = 12,
    brightness = 0.9,
    ambient = { 50, 40, 60 },
    outAmb = { 60, 50, 70 },
    sky = { stars = 3500, sun = 22, moon = 0 },
    atm = {
      dens = 0.5,
      color = { 255, 140, 40 },
      decay = { 30, 20, 40 },
      glare = 2.8,
      haze = 1.8,
    },
  },
  Hellscape = {
    clock = 18,
    brightness = 1.8,
    ambient = { 200, 60, 30 },
    outAmb = { 220, 70, 40 },
    sky = { stars = 100, sun = 30, moon = 0 },
    atm = {
      dens = 0.85,
      color = { 255, 30, 0 },
      decay = { 120, 0, 0 },
      glare = 3.5,
      haze = 4,
    },
    clouds = { cover = 0.95, dens = 0.95, color = { 80, 20, 10 } },
  },
  Heaven = {
    clock = 12,
    brightness = 4,
    ambient = { 240, 235, 210 },
    outAmb = { 250, 245, 220 },
    sky = { sun = 16, moon = 0, stars = 0 },
    atm = {
      dens = 0.25,
      color = { 255, 250, 220 },
      decay = { 255, 240, 200 },
      glare = 3,
      haze = 1.5,
    },
    clouds = { cover = 0.85, dens = 0.5, color = { 255, 255, 255 } },
  },
  Storm = {
    clock = 15,
    brightness = 1.4,
    ambient = { 90, 90, 110 },
    outAmb = { 100, 100, 120 },
    sky = { stars = 0, sun = 6, moon = 0 },
    atm = {
      dens = 0.65,
      color = { 80, 90, 120 },
      decay = { 40, 50, 80 },
      glare = 0.5,
      haze = 3,
    },
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
    atm = {
      dens = 0.08,
      color = { 15, 5, 40 },
      decay = { 5, 0, 20 },
      glare = 0.2,
      haze = 0.3,
    },
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
    atm = {
      dens = 0.6,
      color = { 255, 90, 20 },
      decay = { 200, 40, 0 },
      glare = 3,
      haze = 3.2,
    },
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

local function f59(p48)
  return Color3.fromRGB(p48[1], p48[2], p48[3])
end

local function f60(p49)
  f56()
  f58(true)
  local terrain3 = workspace:FindFirstChildOfClass("Terrain")
  local v116 = v115[p49]

  if not v116 or v116.kind == "off" then
    if v110 then
      for key6, value32 in pairs(v110) do
        local v117 = key6
        local v118 = value32

        if v117 ~= "LightingChildren" and v117 ~= "TerrainChildren" then
          pcall(function() lighting[v117] = v118 end)
        end
      end

      for index28, value33 in ipairs(v110.LightingChildren or {}) do
        value33:Clone().Parent = lighting
      end

      local terrain4 = workspace:FindFirstChildOfClass("Terrain")

      if terrain4 then
        for index29, value34 in ipairs(v110.TerrainChildren or {}) do
          value34:Clone().Parent = terrain4
        end
      end
    end

    _G._CandyHubSkyMode = "Off"
    return
  end

  lighting.FogStart = 0
  lighting.FogEnd = 100000
  lighting.FogColor = Color3.fromRGB(200, 200, 200)
  lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
  lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
  lighting.GlobalShadows = true
  lighting.ClockTime = v116.clock or 14
  lighting.Brightness = v116.brightness or 2

  if v116.outAmb then
    lighting.OutdoorAmbient = f59(v116.outAmb)
  end

  if v116.ambient then
    lighting.Ambient = f59(v116.ambient)
  end

  if v116.sky then
    local v119 = {}

    if v116.sky.stars then
      v119.StarCount = v116.sky.stars
    end

    if v116.sky.moon then
      v119.MoonAngularSize = v116.sky.moon
    end

    if v116.sky.sun then
      v119.SunAngularSize = v116.sky.sun
    end

    if v116.sky.moonTex then
      v119.MoonTextureId = "rbxasset://sky/moon.jpg"
    end

    f57("Sky", lighting, v119)
  end

  if v116.atm then
    f57("Atmosphere", lighting, {
      Density = v116.atm.dens or 0.3,
      Color = f59(v116.atm.color),
      Decay = f59(v116.atm.decay),
      Glare = v116.atm.glare or 1,
      Haze = v116.atm.haze or 1,
    })
  end

-- https://discord.gg/AwGHNh7Z7T
  if v116.clouds and terrain3 then
    f57("Clouds", terrain3, {
      Cover = v116.clouds.cover or 0.5,
      Density = v116.clouds.dens or 0.5,
      Color = f59(v116.clouds.color),
    })
  end

  _G._CandyHubSkyMode = p49
end

local function f61()
  for key7, value35 in pairs(v48.anchor) do
    local v120 = value35
    pcall(function() v120:Disconnect() end)
  end

  v48.anchor = {}
end

v121 = {
  { "Off", "Off" }, { "Night", "Night" }, { "Aurora", "Aurora" }, { "Sunset", "Sunset" },
  { "Galaxy", "Galaxy" }, { "Cyber", "Cyber" }, { "Sakura", "Sakura" },
  { "Pink Night", "Pink Night" }, { "Blood Moon", "Blood Moon" },
  { "Emerald Dawn", "Emerald Dawn" }, { "Volcanic", "Volcanic" }, { "Arctic", "Arctic" },
  { "Midnight Ocean", "Midnight Ocean" }, { "Vaporwave", "Vaporwave" }, { "Toxic", "Toxic" },
  { "Solar Eclipse", "Solar Eclipse" }, { "Hellscape", "Hellscape" }, { "Heaven", "Heaven" },
  { "Storm", "Storm" }, { "Sunrise", "Sunrise" }, { "Deep Space", "Deep Space" },
  { "Lavender Dream", "Lavender Dream" }, { "Inferno", "Inferno" }, { "Mint Sky", "Mint Sky" },
}

local function f62()
  local character24 = localPlayer.Character

  if not character24 then
    return nil
  else
    for index30, value36 in ipairs(character24:GetChildren()) do
      if value36:IsA("Tool") then
        local lower2 = value36.Name:lower()

        if lower2:find("medusa") or lower2:find("head") or lower2:find("stone") then
          return value36
        end
      end
    end

    local backpack2 = localPlayer:FindFirstChild("Backpack")

    if backpack2 then
      for index31, value37 in ipairs(backpack2:GetChildren()) do
        if value37:IsA("Tool") then
          local lower3 = value37.Name:lower()

          if lower3:find("medusa") or lower3:find("head") or lower3:find("stone") then
            return value37
          end
        end
      end

      return nil
    end

    return nil
  end
end

local function f63()
  local v122

  if v8 then
    return
  elseif tick() - v9 < 25 then
    return
  else
    local character25 = localPlayer.Character

    if not character25 then
      return
    end

    v8 = true
    v122 = f62()

    if not v122 then
      v8 = false
      return
    end

    if v122.Parent ~= character25 then
      local humanoid17 = character25:FindFirstChildOfClass("Humanoid")

      if humanoid17 then
        humanoid17:EquipTool(v122)
      end
    end

    pcall(function() v122:Activate() end)
    v9 = tick()
    v8 = false
    return
  end
end

local function f64(p50)
  return p50:GetPropertyChangedSignal("Anchored"):Connect(function()
    if p50.Anchored and p50.Transparency == 1 then
      if v5 then
        f63()
      end
    end
  end)
end

local function f65(p51)
  for key8, value38 in pairs(v48.anchor) do
    local v123 = value38
    pcall(function() v123:Disconnect() end)
  end

  v48.anchor = {}

  if not p51 then
    return
  else
    for index32, value39 in ipairs(p51:GetDescendants()) do
      if value39:IsA("BasePart") then
        table.insert(v48.anchor, f64(value39))
      end
    end

    local descendantAdded = p51.DescendantAdded

    table.insert(v48.anchor, descendantAdded:Connect(function(p52)
      if p52:IsA("BasePart") then
        table.insert(v48.anchor, f64(p52))
      end
    end))

    return
  end
end

local v124 = {
  "Bat", "Slap", "Iron Slap", "Gold Slap", "Diamond Slap", "Emerald Slap", "Ruby Slap",
  "Dark Matter Slap", "Flame Slap", "Nuclear Slap", "Galaxy Slap", "Glitched Slap",
}

local function f66(p53, p54)
  local humanoid18 = p54:FindFirstChildOfClass("Humanoid")

  if p53.Parent ~= p54 then
    if humanoid18 then
      pcall(function() humanoid18:EquipTool(p53) end)
    end

    task.wait(0.05)
  end

  local remoteEvent2 = p53:FindFirstChildOfClass("RemoteEvent")
    or p53:FindFirstChildOfClass("RemoteFunction")

  if remoteEvent2 and remoteEvent2:IsA("RemoteEvent") then
    pcall(function() remoteEvent2:FireServer() end)
    task.wait(0.15)
    pcall(function() remoteEvent2:FireServer() end)
  else
    pcall(function() p53:Activate() end)
    task.wait(0.15)
    pcall(function() p53:Activate() end)
  end
end

local function f67()
  local character26 = localPlayer.Character

  if not character26 then
    return nil
  else
    local backpack3 = localPlayer:FindFirstChildOfClass("Backpack")

    for index33, value40 in ipairs(v124) do
      local findFirstChild3 = character26:FindFirstChild(value40)
        or backpack3 and backpack3:FindFirstChild(value40)

      if findFirstChild3 then
        return findFirstChild3
      end
    end

    for index34, value41 in ipairs(character26:GetChildren()) do
      if value41:IsA("Tool") and value41.Name:lower():find("bat") then
        return value41
      end
    end

    if backpack3 then
      for index35, value42 in ipairs(backpack3:GetChildren()) do
        if value42:IsA("Tool") and value42.Name:lower():find("bat") then
          return value42
        end
      end

      return nil
    end

    return nil
  end
end

local function f68()
  if v48.batCounter then
    v48.batCounter:Disconnect()
    v48.batCounter = nil
  end

  v56 = false
end

local v125

local function f69()
  local humanoidRootPart19 = localPlayer.Character
    and localPlayer.Character:FindFirstChild("HumanoidRootPart")

  local v126, huge2

  if not humanoidRootPart19 then
    return nil
  else
    local v127 = tick()

    if v127 - v16 <= 0.1 and v125 and v125.Parent then
      local humanoid19 = v125.Parent:FindFirstChildOfClass("Humanoid")

      if humanoid19 and humanoid19.Health > 0 then
        return v125
      end

      v126 = nil
      v16 = v127
      v125 = nil
      huge2 = math.huge

      for index36, value43 in ipairs(players:GetPlayers()) do
        if value43 ~= localPlayer and value43.Character then
          local humanoidRootPart20 = value43.Character:FindFirstChild("HumanoidRootPart")
          local humanoid20 = value43.Character:FindFirstChildOfClass("Humanoid")

          if humanoidRootPart20 and humanoid20 and humanoid20.Health > 0 then
            local magnitude3 = (humanoidRootPart20.Position - humanoidRootPart19.Position).Magnitude

            if magnitude3 < huge2 then
              v126 = humanoidRootPart20
              huge2 = magnitude3
            end
          end
        end
      end

      v125 = v126
      return v125
    end

    v126 = nil
    v16 = v127
    v125 = nil
    huge2 = math.huge

    for index37, value44 in ipairs(players:GetPlayers()) do
      if value44 ~= localPlayer and value44.Character then
        local humanoidRootPart21 = value44.Character:FindFirstChild("HumanoidRootPart")
        local humanoid21 = value44.Character:FindFirstChildOfClass("Humanoid")

        if humanoidRootPart21 and humanoid21 and humanoid21.Health > 0 then
          local magnitude4 = (humanoidRootPart21.Position - humanoidRootPart19.Position).Magnitude

          if magnitude4 < huge2 then
            v126 = humanoidRootPart21
            huge2 = magnitude4
          end
        end
      end
    end

    v125 = v126
    return v125
  end
end

local function f70()
  if v48.batCounter then
    return
  end

  v48.batCounter = runService.Heartbeat:Connect(function()
    if not v6 then
      return
    end

    if v56 then
      return
    end

    local character27 = localPlayer.Character

    if not character27 then
      return
    else
      local humanoid22 = character27:FindFirstChildOfClass("Humanoid")

      if not humanoid22 then
        return
      else
        local getState3 = humanoid22:GetState()

        if getState3 == Enum.HumanoidStateType.Physics
          or getState3 == Enum.HumanoidStateType.Ragdoll
          or getState3 == Enum.HumanoidStateType.FallingDown then
          v56 = true

          task.spawn(function()
            local v128 = f67()

            if v128 then
              f66(v128, character27)
            end

            task.wait(0.5)
            v56 = false
          end)
        end

        return
      end
    end
  end)
end

do
  local v129 = false

  local function f71()
    if v11 then
      v11 = false

      if v90 then
        v90(false)
      end

      f35()
    end

    if v12 then
      v12 = false

      if v89 then
        v89(false)
      end

      f34()
    end

    if v20 then
      v129 = true
      f55()

      if v130 then
        v130(false)
      end
    else
      v129 = false
    end

    v15 = false
    v13 = true
  end

  function f51()
    local character28 = localPlayer.Character
    local humanoidRootPart22 = character28 and character28:FindFirstChild("HumanoidRootPart")
    local humanoid23 = character28 and character28:FindFirstChildOfClass("Humanoid")

    if humanoidRootPart22 then
      humanoidRootPart22.AssemblyLinearVelocity = humanoidRootPart22.AssemblyLinearVelocity
        * 0.3

      humanoidRootPart22.AssemblyAngularVelocity = Vector3.zero
    end

    if humanoid23 then
      humanoid23.AutoRotate = true
    end
  end

  local function f72()
    v13 = false
    v15 = false
    local character29 = localPlayer.Character

    if character29 then
      local humanoid24 = character29:FindFirstChildOfClass("Humanoid")

      if humanoid24 then
        humanoid24.AutoRotate = true
      end
    end

    if f51 then
      f51()
    end

    if v129 then
      v129 = false
      v20 = true

      if v130 then
        v130(true)
      end

      f54()
    end
  end

  local function f73()
    if v11 then
      v11 = false

      if v90 then
        v90(false)
      end

      f35()
    end

    if v12 then
      v12 = false

      if v89 then
        v89(false)
      end

      f34()
    end

    f71()
  end

  local function f74()
    v11 = true

    if v12 then
      v12 = false

      if v89 then
        v89(false)
      end

      f34()
    end

    if v13 then
      f72()

      if v106 then
        v106(false)
      end
    end

    f36()
  end

  local function f75()
    v12 = true

    if v11 then
      v11 = false

      if v90 then
        v90(false)
      end

      f35()
    end

    if v13 then
      f72()

      if v106 then
        v106(false)
      end
    end

    f37()
  end

  runService.Heartbeat:Connect(function()
    local humanoid25, bat3

    if not v13 then
      return
    else
      local character30 = localPlayer.Character
      humanoid25 = character30 and character30:FindFirstChildOfClass("Humanoid")
      local humanoidRootPart23 = character30 and character30:FindFirstChild("HumanoidRootPart")

      if not humanoidRootPart23 or not humanoid25 then
        return
      else
        if not v15 then
          v15 = true

          if not character30:FindFirstChildOfClass("Tool") then
            local backpack4 = localPlayer:FindFirstChildOfClass("Backpack")
              or localPlayer:FindFirstChild("Backpack")

            bat3 = backpack4 and backpack4:FindFirstChild("Bat")

            if bat3 then
              pcall(function() humanoid25:EquipTool(bat3) end)
            end
          end
        end

        local v131 = f69()

        if v131 then
          local assemblyLinearVelocity = v131.AssemblyLinearVelocity

          local v132 = v131.Position
            + assemblyLinearVelocity
              * math.clamp(assemblyLinearVelocity.Magnitude / 130, 0.05, 0.15)
            + Vector3.new(0, 1, 0)

          humanoid25.AutoRotate = false
          local v133 = v132 - humanoidRootPart23.Position
          local vector6 = Vector3.new(v133.X, 0, v133.Z)

          if v133.Magnitude > 0.01 and vector6.Magnitude > 0.01 then
            local v134 = math.deg(math.atan2(-vector6.X, -vector6.Z))
            local v135 = math.deg(math.atan2(v133.Y, vector6.Magnitude))
            local v136 = math.rad((v134 - humanoidRootPart23.Orientation.Y + 180) % 360 - 180)
            local v137 = math.clamp(v136 * 285, -28, 28)
            local v138 = math.rad((v135 - humanoidRootPart23.Orientation.X + 180) % 360 - 180)
            local v139 = math.clamp(v138 * 285, -28, 28)
            local v140 = math.rad(humanoidRootPart23.Orientation.Y)
            local v141 = math.cos(v140)
            local v142 = math.sin(v140)
            local vector7 = Vector3.new(v141, 0, -v142)

            humanoidRootPart23.AssemblyAngularVelocity = Vector3.new(0, v137, 0)
              + vector7 * v139
          else
            humanoidRootPart23.AssemblyAngularVelocity = Vector3.zero
          end

          local v143 = v132 - (v133.Magnitude > 0.01 and v133.Unit or Vector3.zero) * -2.8
              + Vector3.new(0, 4.75, 0)
            - humanoidRootPart23.Position

          local vector8 = Vector3.new(v143.X, 0, v143.Z)

          humanoidRootPart23.AssemblyLinearVelocity = (vector8.Magnitude > 0.1
                and vector8.Unit * 58
              or Vector3.zero)
            + (math.abs(v143.Y) > 0.1 and Vector3.new(0, math.sign(v143.Y) * 52, 0)
              or Vector3.new(0, -2, 0))

          if vector8.Magnitude > 0.5 then
            humanoid25:Move(vector8.Unit, false)
          end
        else
          humanoid25.AutoRotate = true
          humanoidRootPart23.AssemblyAngularVelocity = Vector3.zero
        end

        if v14 then
          local bat4 = character30:FindFirstChild("Bat")

          if bat4 and bat4:IsA("Tool") then
            bat4:Activate()
          end
        end

        return
      end
    end
  end)

  localPlayer.CharacterAdded:Connect(function(character31)
    task.wait(0.5)
    f19(character31)

    if v5 then
      f65(character31)
    end

    if v6 then
      f70()
    end

    if v7 then
      task.wait(0.5)
      f38()
    end
  end)

  if localPlayer.Character then
    f19(localPlayer.Character)
  end

  local function f76()
    local function f77(p55)
      return { kb = p55.kb and p55.kb.Name or nil, gp = p55.gp and p55.gp.Name or nil }
    end

    local normalSpeed2 = normalSpeed
    local carrySpeed2 = carrySpeed
    local dropBrainrotKey = f77(v43.DropBrainrot)
    local autoLeftKey = f77(v43.AutoLeft)
    local autoRightKey = f77(v43.AutoRight)
    local autoBatKey = f77(v43.AutoBat)
    local mwvaneTPBatKey = f77(v43.TPBat)
    local laggerToggleKey = f77(v43.LaggerToggle)
    local tpFloorKey = f77(v43.TPFloor)
    local guiHideKey = f77(v43.GuiHide)
    local speedToggleKey = f77(v43.SpeedToggle)
    local getRadius = v44:getRadius()
    local getDuration = v44:getDuration()
    local stealMode = v44.StealMode
    local antiRagdoll = v2
    local autoStealEnabled = v44.AutoStealEnabled
    local infiniteJump = v3
    local infJumpMode = lower
    local medusaCounter = v5
    local batCounter = v6
    local carryMode = v1
    local laggerMode = v4
    local laggerCarryMode2 = laggerCarryMode == 2
    local laggerSpeed2 = laggerSpeed
    local laggerCarrySpeed2 = laggerCarrySpeed
    local autoBat = v13
    local autoSwing = v14
    local unwalkEnabled = v7

    local v144 = {
      normalSpeed = normalSpeed2,
      carrySpeed = carrySpeed2,
      dropBrainrotKey = dropBrainrotKey,
      autoLeftKey = autoLeftKey,
      autoRightKey = autoRightKey,
      autoBatKey = autoBatKey,
      mwvaneTPBatKey = mwvaneTPBatKey,
      laggerToggleKey = laggerToggleKey,
      tpFloorKey = tpFloorKey,
      guiHideKey = guiHideKey,
      speedToggleKey = speedToggleKey,
      grabRadius = getRadius,
      stealDuration = getDuration,
      stealMode = stealMode,
      antiRagdoll = antiRagdoll,
      autoStealEnabled = autoStealEnabled,
      infiniteJump = infiniteJump,
      infJumpMode = infJumpMode,
      medusaCounter = medusaCounter,
      batCounter = batCounter,
      carryMode = carryMode,
      laggerMode = laggerMode,
      laggerCarryMode = laggerCarryMode2,
      laggerSpeed = laggerSpeed2,
      laggerCarrySpeed = laggerCarrySpeed2,
      autoBat = autoBat,
      autoSwing = autoSwing,
      unwalkEnabled = unwalkEnabled,
      tryhardAnim = v18,
      antiLag = antiLag,
      stretchRez = v17,
      autoTPEnabled = v20,
      autoTPHeight = autoTPHeight,
      mwvaneTPBatRange = _G.MWVANE_TP_BAT_RANGE,
      skyTheme = _G._CandyHubSkyMode or "Off",
      selectedBgIndex = _G.selectedBgIndex,
      uiLocked = v21,
      sc_headless = scHeadless,
      sc_korblox = scKorblox,
      sc_outfit = scOutfit,
      sc_animPack = v22,
      sc_animPackActive = scAnimPackActive,
    }

    if writefile then
      pcall(function() writefile("fadeaway_settings.json", httpService:JSONEncode(v144)) end)
    end
  end

  _G._saveConfig = f76

  task.spawn(function()
    while task.wait(5) do
      f76()
    end
  end)

  _G.selectedBgIndex = 1
  _G.BG_IDS = { "121659577844718" }

  local instance11

  local function f78()
    if instance11 then
      local v145 = instance11

      v145.Text = v4 and (laggerCarryMode == 2 and "Lagger Carry" or "Lagger Normal")
        or v1 and "Carry" or "Normal"
    end
  end

  function _G.S2SpeedSetNormal()
    v1 = false
    v4 = false
    laggerCarryMode = 0
    f78()
  end

  function _G.S2SpeedSetCarry()
    v1 = true
    v4 = false
    laggerCarryMode = 0
    f78()
  end

  local v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158

  local function f79()
    local v159 = v158

    if not v159 then
      return
    end

    if v152 then
      v152.Text = tostring(normalSpeed)
    end

    if v153 then
      v153.Text = tostring(carrySpeed)
    end

    if v156 then
      v156.Text = tostring(v44:getRadius())
    end

    if v151 then
      v151.Text = string.format("Radius: %.2g", v44:getRadius())
    end

    if v154 then
      v154.Text = tostring(laggerSpeed)
    end

    if v155 then
      v155.Text = tostring(laggerCarrySpeed)
    end

    if v157 then
      v157.Text = tostring(autoTPHeight)
    end

    task.spawn(function()
      task.wait(0.15)

      if v159.antiRagdoll then
        v2 = true

        if _G.setAntiRagVisual then
          _G.setAntiRagVisual(true)
        end

        f15()
      end

      if v159.autoStealEnabled then
        v44.AutoStealEnabled = true

        if _G.setInstaGrab then
          _G.setInstaGrab(true)
        end

        pcall(f32)
      end

      if v159.infiniteJump then
        v3 = true

        if _G.setInfJumpVisual then
          _G.setInfJumpVisual(true)
        end
      end

      local infJumpMode2 = v159.infJumpMode

      if infJumpMode2 then
        infJumpMode2 = v159.infJumpMode
        lower = infJumpMode2
      end

      if v159.medusaCounter then
        v5 = true

        if _G.setMedusaVisual then
          _G.setMedusaVisual(true)
        end
      end

      if v5 then
        f65(localPlayer.Character)
      end

      if v159.batCounter then
        v6 = true

        if v146 then
          v146(true)
        end

        f70()
      end

      if v159.laggerMode then
        v4 = true
        v1 = false
        laggerCarryMode = v159.laggerCarryMode and 2 or 1
        f78()
      elseif v159.carryMode then
        v1 = true
        f78()
      end

      if v159.autoTPEnabled then
        v20 = true

        if v130 then
          v130(true)
        end

        f54()
      end

      if v159.autoSwing ~= nil then
        v14 = v159.autoSwing == true
      end

      if _G.setAutoSwingVisual then
        _G.setAutoSwingVisual(v14)
      end

      if v159.autoBat then
        v13 = true

        if v106 then
          v106(true)
        end

        f73()
      end

      if v159.unwalkEnabled then
        v7 = true

        if _G.setUnwalkVisual then
          _G.setUnwalkVisual(true)
        end

        task.spawn(function()
          task.wait(0.5)
          f38()
        end)
      end

      if v159.tryhardAnim then
        v18 = true

        if v149 then
          v149(true)
        end

        f47()
      end

      if v159.antiLag or v159.dawgOpt then
        antiLag = true

        if v147 then
          v147(true)
        end
      end

      if v159.stretchRez then
        f50()

        if v148 then
          v148(true)
        end
      end

      if type(v159.skyTheme) == "string" then
        f60(v159.skyTheme)
      end

      if v159.uiLocked then
        v21 = true

        if v150 then
          v150(true)
        end
      end

      if type(v159.sc_headless) == "boolean" then
        scHeadless = v159.sc_headless
      end

      if type(v159.sc_korblox) == "boolean" then
        scKorblox = v159.sc_korblox
      end

      if type(v159.sc_outfit) == "string" then
        scOutfit = v159.sc_outfit
      end

      if type(v159.sc_animPack) == "string" and v24[v159.sc_animPack] then
        _G[v159[v2("\214\193\227Ż\133f\r\238P\20c\255\197x\184", 4851007719634)]] = infJumpMode2
        return
      end

      if type(v159.sc_animPackActive) == "boolean" then
        scAnimPackActive = v159.sc_animPackActive
      end
    end)
  end

  function _G.S2SpeedSetLaggerNormal()
    v1 = false
    v4 = true
    laggerCarryMode = 1
    f78()
  end

  function _G.S2SpeedSetLaggerCarry()
    v1 = false
    v4 = true
    laggerCarryMode = 2
    f78()
  end

  local function f80()
    if not v4 then
      v1 = false
      v4 = true
      laggerCarryMode = 2
    elseif laggerCarryMode == 2 then
      laggerCarryMode = 1
    else
      laggerCarryMode = 2
    end

    f78()
  end

  local function f81()
    if v4 then
      v4 = false
      laggerCarryMode = 0
      v1 = true
    else
      v1 = not v1
    end

    f78()
  end

  local instance12

  local function f82()
    local color = Color3.fromRGB(0, 0, 0)
    local color2 = Color3.fromRGB(2, 18, 7)
    local color3 = Color3.fromRGB(8, 45, 18)
    local color4 = Color3.fromRGB(60, 230, 100)
    local color5 = Color3.fromRGB(40, 200, 90)
    local color6 = Color3.fromRGB(200, 200, 200)
    local color7 = Color3.fromRGB(90, 255, 130)
    local color8 = Color3.fromRGB(255, 255, 255)
    local color9 = Color3.fromRGB(220, 220, 220)
    local color10 = Color3.fromRGB(2, 12, 5)
    local color11 = Color3.fromRGB(3, 22, 8)
    local shadowHub = coreGui:FindFirstChild("ShadowHub")

    if shadowHub then
      shadowHub:Destroy()
    end

    local playerGui2 = localPlayer:FindFirstChild("PlayerGui")

    if playerGui2 then
      local shadowHub2 = playerGui2:FindFirstChild("ShadowHub")

      if shadowHub2 then
        shadowHub2:Destroy()
      end
    end

    local shadowHub3 = Instance.new("ScreenGui")
    shadowHub3.Name = "ShadowHub"
    shadowHub3.ResetOnSpawn = false
    shadowHub3.DisplayOrder = 10
    shadowHub3.IgnoreGuiInset = true

    pcall(function()
      if syn and syn.protect_gui then
        syn.protect_gui(shadowHub3)
      end
    end)

    if not pcall(function() shadowHub3.Parent = coreGui end) then
      shadowHub3.Parent = localPlayer:WaitForChild("PlayerGui")
    end

    local instance13 = Instance.new("CanvasGroup", shadowHub3)
    local udim = UDim2.new(0, 300, 0, 360)
    local udim2 = UDim2.new(0, 300, 0, 58)
    local v160 = false
    local udim3 = UDim2.new(0, 20, 0, 20)

    instance13.Size = UDim2.new(0, 300, 0, 340)
    instance13.Position = UDim2.new(0.5, -150, 0.5, -170)
    instance13.BackgroundColor3 = color
    instance13.BackgroundTransparency = 0.2
    instance13.GroupTransparency = 1
    instance13.BorderSizePixel = 0
    instance13.ClipsDescendants = true

    Instance.new("UICorner", instance13).CornerRadius = UDim.new(0, 12)

    task.spawn(function()
      tweenService:Create(
        instance13, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        { Size = udim, Position = udim3, GroupTransparency = 0 }
      ):Play()
    end)

    local instance14 = Instance.new("ImageLabel", instance13)
    instance14.Size = UDim2.new(1, 0, 1, 0)
    instance14.Position = UDim2.new(0, 0, 0, 0)
    instance14.BackgroundTransparency = 1
    instance14.BorderSizePixel = 0
    instance14.Image = "rbxassetid://121659577844718"
    instance14.ZIndex = 1
    instance14.ImageTransparency = 0

    Instance.new("UICorner", instance14).CornerRadius = UDim.new(0, 12)

    local function f83(p56)
      local v161 = false
      local position = false
      local position2 = false
      local v162 = false

      p56.InputBegan:Connect(function(input3)
        if v21 then
          return
        end

        if input3.UserInputType == Enum.UserInputType.MouseButton1
          or input3.UserInputType == Enum.UserInputType.Touch then
          v161 = true
          position = input3.Position
          position2 = p56.Position

          input3.Changed:Connect(function()
            if input3.UserInputState == Enum.UserInputState.End then
              v161 = false
            end
          end)
        end
      end)

      p56.InputChanged:Connect(function(input4)
        if input4.UserInputType == Enum.UserInputType.MouseMovement
          or input4.UserInputType == Enum.UserInputType.Touch then
          v162 = input4
        end
      end)

      userInputService.InputChanged:Connect(function(input5)
        if v21 then
          return
        end

        if input5 == v162 and v161 then
          p56.Position = UDim2.new(
            position2.X.Scale, position2.X.Offset + (input5.Position.X - position.X),
            position2.Y.Scale, position2.Y.Offset + (input5.Position.Y - position.Y)
          )
        end
      end)
    end

    f83(instance13)

    local instance15 = Instance.new("Frame", instance13)
    instance15.Size = UDim2.new(1, 0, 0, 64)
    instance15.Position = UDim2.new(0, 0, 0, 0)
    instance15.BackgroundColor3 = color2
    instance15.BackgroundTransparency = 1
    instance15.BorderSizePixel = 0
    instance15.ZIndex = 2

    Instance.new("UICorner", instance15).CornerRadius = UDim.new(0, 12)

    local instance16 = Instance.new("Frame", instance15)
    instance16.Size = UDim2.new(1, 0, 0, 10)
    instance16.Position = UDim2.new(0, 0, 1, -10)
    instance16.BackgroundColor3 = color2
    instance16.BackgroundTransparency = 1
    instance16.BorderSizePixel = 0
    instance16.ZIndex = 1

    local mainLogo = Instance.new("ImageLabel", instance15)
    mainLogo.Name = "MainLogo"
    mainLogo.Size = UDim2.new(0, 260, 0, 58)
    mainLogo.Position = UDim2.new(0.5, -130, 0.5, -29)
    mainLogo.BackgroundTransparency = 1
    mainLogo.BorderSizePixel = 0
    mainLogo.Image = "rbxassetid://114193031021374"
    mainLogo.ScaleType = Enum.ScaleType.Fit
    mainLogo.ZIndex = 3

    local instance17 = Instance.new("TextButton", instance15)
    instance17.Size = UDim2.new(0, 28, 0, 28)
    instance17.Position = UDim2.new(1, -34, 0.5, -14)
    instance17.BackgroundColor3 = color2
    instance17.BorderSizePixel = 0
    instance17.ZIndex = 3
    instance17.Text = "−"
    instance17.TextColor3 = color6
    instance17.Font = Enum.Font.GothamBold
    instance17.TextSize = 22

    Instance.new("UICorner", instance17).CornerRadius = UDim.new(0, 8)

    instance17.MouseEnter:Connect(function()
      tweenService:Create(instance17, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3.fromRGB(12, 65, 25),
        TextColor3 = color5,
      }):Play()
    end)

    instance17.MouseLeave:Connect(function()
      tweenService:Create(instance17, TweenInfo.new(0.1), {
        BackgroundColor3 = color2,
        TextColor3 = color6,
      }):Play()
    end)

    local instance18 = nil
    local instance19, instance20

    local function f84(p57)
      if v160 == p57 then
        return
      else
        v160 = p57
        local out = p57 and Enum.EasingDirection.In or Enum.EasingDirection.Out
        local size = p57 and udim2 or udim
        instance17.Text = p57 and "+" or "−"

        if p57 then
          instance19.Visible = false
          instance20.Visible = false
          instance18.Visible = false
          instance14.Visible = true
        else
          instance19.Visible = true
          instance20.Visible = true
          instance18.Visible = true
          instance14.Visible = true
        end

        tweenService:Create(instance13, TweenInfo.new(0.42, Enum.EasingStyle.Quint, out), {
          Size = size,
          GroupTransparency = 0,
        }):Play()

        return
      end
    end

    instance17.Activated:Connect(function() f84(not v160) end)

    instance19 = Instance.new("Frame", instance13)
    instance19.Size = UDim2.new(1, 0, 0, 0)
    instance19.Position = UDim2.new(0, 0, 0, 64)
    instance19.BackgroundTransparency = 1
    instance19.BorderSizePixel = 0
    instance19.ZIndex = 2

    local v163 = "Speed"

    local v164 = {
      Speed = {},
      Combat = {},
      Bat = {},
      Visual = {},
      Config = {},
    }

    local v165 = {}

    instance18 = Instance.new("Frame", instance13)
    instance18.Size = UDim2.new(1, 0, 0, 50)
    instance18.Position = UDim2.new(0, 0, 1, -50)
    instance18.BackgroundColor3 = color2
    instance18.BackgroundTransparency = 0.7
    instance18.BorderSizePixel = 0
    instance18.ZIndex = 2

    Instance.new("UICorner", instance18).CornerRadius = UDim.new(0, 10)

    local instance21 = Instance.new("UIListLayout", instance18)
    instance21.FillDirection = Enum.FillDirection.Horizontal
    instance21.SortOrder = Enum.SortOrder.LayoutOrder
    instance21.Padding = UDim.new(0, 4)
    instance21.HorizontalAlignment = Enum.HorizontalAlignment.Center
    instance21.VerticalAlignment = Enum.VerticalAlignment.Center

    local function f85(p58)
      v163 = p58

      for key9, value45 in pairs(v164) do
        for index38, value46 in ipairs(value45) do
          if value46.Name == "StealModeTabs" or value46.Name == "JumpModeTabs" then
            value46.Visible = false

            if _G._stealChevronIcon then
              _G._stealChevronIcon.Text = "▼"
            end

            if _G._jumpChevronIcon then
              _G._jumpChevronIcon.Text = "▼"
            end
          else
            value46.Visible = key9 == v163
          end
        end
      end

      for key10, value47 in pairs(v165) do
        local v166 = key10 == p58

        tweenService:Create(value47, TweenInfo.new(0.15), {
          BackgroundColor3 = v166 and color6 or color,
        }):Play()

        value47.TextColor3 = v166 and Color3.fromRGB(255, 255, 255)
          or Color3.fromRGB(150, 210, 160)

        local uiStroke = value47:FindFirstChildOfClass("UIStroke")

        if uiStroke then
          uiStroke.Transparency = v166 and 0 or 1
        end
      end
    end

    for index39, value48 in ipairs({ "Speed", "Combat", "Bat", "Visual", "Config" }) do
      local v167 = value48

      local instance22 = Instance.new("TextButton", instance18)
      instance22.Size = UDim2.new(0.19, 0, 0, 35)
      instance22.LayoutOrder = index39
      instance22.BackgroundColor3 = v167 == "Speed" and color6 or color
      instance22.BorderSizePixel = 0
      instance22.ClipsDescendants = false
      instance22.Text = v167

      instance22.TextColor3 = v167 == "Speed" and Color3.fromRGB(255, 255, 255)
        or Color3.fromRGB(150, 210, 160)

      instance22.Font = Enum.Font.GothamBold
      instance22.TextSize = 12
      instance22.ZIndex = 5

      Instance.new("UICorner", instance22).CornerRadius = UDim.new(0, 8)

      local instance23 = Instance.new("UIStroke", instance22)
      instance23.Color = color7
      instance23.Thickness = 1.5
      instance23.Transparency = v167 == "Speed" and 0 or 1

      v165[v167] = instance22

      instance22.MouseEnter:Connect(function()
        tweenService:Create(instance22, TweenInfo.new(0.15), {
          BackgroundColor3 = v167 == v163 and color6 or color4,
        }):Play()
      end)

      instance22.MouseLeave:Connect(function()
        tweenService:Create(instance22, TweenInfo.new(0.15), {
          BackgroundColor3 = v167 == v163 and color6 or color,
        }):Play()
      end)

      instance22.MouseButton1Click:Connect(function() f85(v167) end)
    end

    instance20 = Instance.new("ScrollingFrame", instance13)
    instance20.Size = UDim2.new(1, 0, 1, -114)
    instance20.Position = UDim2.new(0, 0, 0, 64)
    instance20.BackgroundTransparency = 1
    instance20.BorderSizePixel = 0
    instance20.ClipsDescendants = true
    instance20.ZIndex = 2
    instance20.ScrollBarThickness = 0
    instance20.ScrollBarImageTransparency = 1

    local function f86(p59, p60, p61, p62, p63)
      local instance24 = Instance.new("TextBox", p59)
      instance24.Size = UDim2.new(0, p61 or 50, 0, 22)
      instance24.Position = UDim2.new(1, -(p62 or 56), 0.5, -11)
      instance24.BackgroundColor3 = Color3.fromRGB(8, 70, 25)
      instance24.BorderSizePixel = 0
      instance24.Text = tostring(p60)
      instance24.TextColor3 = color8
      instance24.Font = Enum.Font.GothamBold
      instance24.TextSize = 11
      instance24.ClearTextOnFocus = false
      instance24.ZIndex = 5

      Instance.new("UICorner", instance24).CornerRadius = UDim.new(0, 10)

      local instance25 = Instance.new("UIStroke", instance24)
      instance25.Color = Color3.fromRGB(255, 255, 255)
      instance25.Thickness = 1

      instance24.Focused:Connect(function()
        tweenService:Create(instance25, TweenInfo.new(0.12), { Color = color6 }):Play()
      end)

      instance24.FocusLost:Connect(function()
        tweenService:Create(instance25, TweenInfo.new(0.12), {
          Color = Color3.fromRGB(8, 45, 18),
        }):Play()

        if p63 then
          local v168 = tonumber(instance24.Text)

          if v168 then
            p63(v168)
          else
            instance24.Text = tostring(p60)
          end
        end
      end)

      return instance24
    end

    instance20.CanvasSize = UDim2.new(0, 0, 0, 0)
    instance20.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local instance26 = Instance.new("UIListLayout", instance20)
    instance26.SortOrder = Enum.SortOrder.LayoutOrder
    instance26.Padding = UDim.new(0, 2)

    local instance27 = Instance.new("UIPadding", instance20)
    instance27.PaddingLeft = UDim.new(0, 7)
    instance27.PaddingRight = UDim.new(0, 7)
    instance27.PaddingTop = UDim.new(0, 7)
    instance27.PaddingBottom = UDim.new(0, 10)

    local count2 = 0

    local function f87(p64, p65)
      local instance28 = Instance.new("Frame", p64)
      instance28.Size = UDim2.new(0, 36, 0, 19)
      instance28.Position = UDim2.new(1, -(p65 or 42), 0.5, -9.5)
      instance28.BackgroundColor3 = color11
      instance28.BorderSizePixel = 0
      instance28.ZIndex = 3

      Instance.new("UICorner", instance28).CornerRadius = UDim.new(1, 0)

      local instance29 = Instance.new("Frame", instance28)
      instance29.Size = UDim2.new(0, 13, 0, 13)
      instance29.Position = UDim2.new(0, 3, 0.5, -6.5)
      instance29.BackgroundColor3 = color9
      instance29.BorderSizePixel = 0
      instance29.ZIndex = 4

      Instance.new("UICorner", instance29).CornerRadius = UDim.new(1, 0)
      return instance28, instance29
    end

    local v169 = "Speed"

    local function f88(p66, p67, p68)
      tweenService:Create(p66, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
        BackgroundColor3 = p68 and Color3.fromRGB(25, 150, 70) or color11,
      }):Play()

      tweenService:Create(p67, TweenInfo.new(0.18, Enum.EasingStyle.Back), {
        Position = p68 and UDim2.new(1, -16, 0.5, -6.5) or UDim2.new(0, 3, 0.5, -6.5),
        BackgroundColor3 = p68 and color5 or color9,
      }):Play()
    end

    local function f89()
      count2 = count2 + 1
      return count2
    end

    local function f90(p69, text)
      local instance30 = Instance.new("TextLabel", p69)
      instance30.Size = UDim2.new(0.58, 0, 1, 0)
      instance30.Position = UDim2.new(0, 9, 0, 0)
      instance30.BackgroundTransparency = 1
      instance30.Text = text
      instance30.TextColor3 = color8
      instance30.Font = Enum.Font.GothamBold
      instance30.TextSize = 11
      instance30.TextXAlignment = Enum.TextXAlignment.Left
    end

    local function f91(p70, p71)
      local v170 = p71 or "Speed"
      v169 = v170

      local instance31 = Instance.new("Frame", instance20)
      instance31.Size = UDim2.new(1, 0, 0, 20)
      instance31.BackgroundTransparency = 1
      instance31.BorderSizePixel = 0
      instance31.LayoutOrder = f89()
      instance31.Visible = v170 == v163

      table.insert(v164[v170], instance31)

      local instance32 = Instance.new("TextLabel", instance31)
      instance32.Size = UDim2.new(1, -8, 1, 0)
      instance32.Position = UDim2.new(0, 8, 0, 0)
      instance32.BackgroundTransparency = 1
      instance32.Text = p70:upper()
      instance32.TextColor3 = color5
      instance32.Font = Enum.Font.GothamBlack
      instance32.TextSize = 9
      instance32.TextXAlignment = Enum.TextXAlignment.Left
      instance32.TextStrokeTransparency = 0.85
      instance32.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    end

    local function f92(p72)
      local instance33 = Instance.new("Frame", instance20)
      instance33.Size = UDim2.new(1, 0, 0, p72 or 32)
      instance33.BackgroundColor3 = color3
      instance33.BackgroundTransparency = 0.25
      instance33.BorderSizePixel = 0
      instance33.LayoutOrder = f89()
      instance33.Visible = v169 == v163

      table.insert(v164[v169], instance33)

      Instance.new("UICorner", instance33).CornerRadius = UDim.new(0, 8)
      Instance.new("UIStroke", instance33).Color = Color3.fromRGB(8, 35, 15)

      instance33.MouseEnter:Connect(function()
        tweenService:Create(instance33, TweenInfo.new(0.08), { BackgroundColor3 = color4 }):Play()
      end)

      instance33.MouseLeave:Connect(function()
        tweenService:Create(instance33, TweenInfo.new(0.08), { BackgroundColor3 = color3 }):Play()
      end)

      return instance33
    end

    local function f93(p73, fn)
      local v171 = f92(32)
      f90(v171, p73)
      local v172, v173 = f87(v171, 42)
      local v174 = false

      local function f94(p74)
        v174 = p74
        f88(v172, v173, p74)
      end

      local instance34 = Instance.new("TextButton", v172)
      instance34.Size = UDim2.new(1, 0, 1, 0)
      instance34.BackgroundTransparency = 1
      instance34.Text = ""
      instance34.ZIndex = 5

      instance34.Activated:Connect(function()
        v174 = not v174
        f94(v174)
        fn(v174)
      end)

      v172.ZIndex = 3
      v173.ZIndex = 4
      return f94
    end

    local v175 = {
      [Enum.KeyCode.ButtonA] = true,
      [Enum.KeyCode.ButtonB] = true,
      [Enum.KeyCode.ButtonX] = true,
      [Enum.KeyCode.ButtonY] = true,
      [Enum.KeyCode.ButtonL1] = true,
      [Enum.KeyCode.ButtonR1] = true,
      [Enum.KeyCode.ButtonL2] = true,
      [Enum.KeyCode.ButtonR2] = true,
      [Enum.KeyCode.ButtonL3] = true,
      [Enum.KeyCode.ButtonR3] = true,
      [Enum.KeyCode.ButtonStart] = true,
      [Enum.KeyCode.ButtonSelect] = true,
      [Enum.KeyCode.DPadUp] = true,
      [Enum.KeyCode.DPadDown] = true,
      [Enum.KeyCode.DPadLeft] = true,
      [Enum.KeyCode.DPadRight] = true,
    }

    local function f95(p75)
      return p75 and p75.UserInputType and p75.UserInputType.Name:match("^Gamepad") ~= nil
    end

    local function f96(p76, p77)
      return p77 and (p77 == p76.kb or p76.gp and p77 == p76.gp)
    end

    local f97

    local function f98(p78, p79, p80)
      local instance35 = Instance.new("Frame", p78)
      instance35.Size = UDim2.new(0, 68, 0, 22)
      instance35.Position = UDim2.new(1, -72, 0.5, -11)
      instance35.BackgroundTransparency = 1

      local instance36 = Instance.new("TextButton", instance35)
      instance36.Size = UDim2.new(0, 46, 0, 22)
      instance36.Position = UDim2.new(0, 0, 0, 0)
      instance36.BackgroundColor3 = color10
      instance36.BorderSizePixel = 0

      local function f99()
        return p79.gp and p79.gp.Name or p79.kb and p79.kb.Name or "None"
      end

      instance36.Text = f99()
      instance36.TextColor3 = color8
      instance36.Font = Enum.Font.GothamBold
      instance36.TextSize = 9
      instance36.ZIndex = 5

      Instance.new("UICorner", instance36).CornerRadius = UDim.new(0, 10)

      local instance37 = Instance.new("TextButton", instance35)
      instance37.Size = UDim2.new(0, 18, 0, 22)
      instance37.Position = UDim2.new(0, 50, 0, 0)
      instance37.BackgroundColor3 = Color3.fromRGB(12, 90, 35)
      instance37.BorderSizePixel = 0
      instance37.Text = "X"
      instance37.TextColor3 = Color3.fromRGB(130, 255, 160)
      instance37.Font = Enum.Font.GothamBold
      instance37.TextSize = 10
      instance37.ZIndex = 5

      Instance.new("UICorner", instance37).CornerRadius = UDim.new(0, 10)
      local v176 = false
      local text2 = instance36.Text
      local v177 = 0
      local connect5

      instance36.Activated:Connect(function()
        if v176 then
          v176 = false
          v19 = false

          if connect5 then
            connect5:Disconnect()
            connect5 = nil
          end

          instance36.Text = text2
          instance36.TextColor3 = color8

          return
        end

        text2 = instance36.Text
        v176 = true
        v19 = true
        v177 = tick()

        instance36.Text = "..."
        instance36.TextColor3 = color8

        connect5 = userInputService.InputBegan:Connect(function(input6)
          if not v176 then
            return
          elseif input6.KeyCode == Enum.KeyCode.Escape then
            v176 = false
            v19 = false

            if connect5 then
              connect5:Disconnect()
              connect5 = nil
            end

            instance36.Text = text2
            instance36.TextColor3 = color8

            return
          else
            local v178 = f95(input6)

            if v178 and tick() - v177 < 0.15 then
              return
            end

            if not f97(input6) then
              return
            end

            instance36.Text = input6.KeyCode.Name
            text2 = input6.KeyCode.Name
            instance36.TextColor3 = color8
            v176 = false
            v19 = false

            if connect5 then
              connect5:Disconnect()
              connect5 = nil
            end

            if p80 then
              p80(input6.KeyCode, v178)
            end

            return
          end
        end)
      end)

      instance37.Activated:Connect(function()
        p79.kb = nil
        p79.gp = nil

        instance36.Text = "None"
        text2 = "None"

        if p80 then
          p80(nil, false)
        end
      end)

      return instance36
    end

    function f97(p81)
      if not p81 or p81.KeyCode == Enum.KeyCode.Unknown then
        return false
      end

      if p81.UserInputType == Enum.UserInputType.Keyboard then
        return true
      end

      return f95(p81) and v175[p81.KeyCode] == true
    end

    local function f100(p82, p83, p84, p85)
      local v179 = f92(32)
      f90(v179, p82)

      if p83 then
        f98(v179, p83, function(p86, p87)
          if p87 then
            p83.gp = p86
            p83.kb = nil
          else
            p83.kb = p86
            p83.gp = nil
          end

          if p85 then
            p85(p86, p87)
          end
        end)
      end

      local v180, v181 = f87(v179, p83 and 102 or 42)
      local v182 = false

      local function f101(p88)
        v182 = p88
        f88(v180, v181, p88)
      end

      local instance38 = Instance.new("TextButton", v180)
      instance38.Size = UDim2.new(1, 0, 1, 0)
      instance38.BackgroundTransparency = 1
      instance38.Text = ""
      instance38.ZIndex = 5

      instance38.Activated:Connect(function()
        if v19 then
          return
        end

        v182 = not v182
        f101(v182)

        if p84 then
          p84(v182)
        end
      end)

      v180.ZIndex = 3
      v181.ZIndex = 4
      return f101
    end

    local playerGui3 = localPlayer:WaitForChild("PlayerGui")

    local stealBar = Instance.new("ScreenGui", playerGui3)
    stealBar.Name = "StealBar"
    stealBar.ResetOnSpawn = false
    stealBar.DisplayOrder = 500
    stealBar.IgnoreGuiInset = true

    local stealBar2 = Instance.new("Frame", stealBar)
    stealBar2.Name = "StealBar"
    stealBar2.Size = UDim2.new(0, 300, 0, 60)
    stealBar2.Position = UDim2.new(0.5, -150, 1, -68)
    stealBar2.BackgroundColor3 = Color3.fromRGB(25, 125, 55)
    stealBar2.BorderSizePixel = 0
    stealBar2.Active = true
    stealBar2.ZIndex = 90

    Instance.new("UICorner", stealBar2).CornerRadius = UDim.new(0, 12)

    local instance39 = Instance.new("UIStroke", stealBar2)
    instance39.Color = Color3.fromRGB(105, 235, 125)
    instance39.Thickness = 1.2

    f83(stealBar2)

    local instance40 = Instance.new("UIGradient", stealBar2)

    instance40.Color = ColorSequence.new(
      Color3.fromRGB(45, 165, 75), Color3.fromRGB(12, 75, 28)
    )

    instance40.Rotation = 135

    instance12 = Instance.new("ImageLabel", stealBar2)
    instance12.Size = UDim2.new(1, 0, 1, 0)
    instance12.BackgroundTransparency = 1
    instance12.ZIndex = 91

    Instance.new("UICorner", instance12).CornerRadius = UDim.new(0, 12)

    local instance41 = Instance.new("Frame", stealBar2)
    instance41.Size = UDim2.fromOffset(6, 6)
    instance41.Position = UDim2.fromOffset(11, 7)
    instance41.BackgroundColor3 = Color3.fromRGB(100, 255, 130)
    instance41.BorderSizePixel = 0
    instance41.ZIndex = 92

    Instance.new("UICorner", instance41).CornerRadius = UDim.new(1, 0)

    local instance42 = Instance.new("TextLabel", stealBar2)
    instance42.Size = UDim2.new(0, 100, 0, 18)
    instance42.Position = UDim2.fromOffset(22, 2)
    instance42.BackgroundTransparency = 1
    instance42.Text = "● 0%"
    instance42.TextColor3 = Color3.fromRGB(255, 255, 255)
    instance42.Font = Enum.Font.GothamBold
    instance42.TextSize = 15
    instance42.TextXAlignment = Enum.TextXAlignment.Left
    instance42.ZIndex = 92

    local instance43 = Instance.new("TextLabel", stealBar2)
    instance43.Size = UDim2.new(0, 120, 0, 18)
    instance43.Position = UDim2.new(1, -130, 0, 2)
    instance43.BackgroundTransparency = 1
    instance43.Text = "Radius: " .. tostring(v44:getRadius())
    instance43.TextColor3 = Color3.fromRGB(245, 245, 245)
    instance43.Font = Enum.Font.GothamBold
    instance43.TextSize = 12
    instance43.TextXAlignment = Enum.TextXAlignment.Right
    instance43.ZIndex = 92

    local instance44 = Instance.new("TextLabel", stealBar2)
    instance44.Size = UDim2.new(0.5, -10, 0, 13)
    instance44.Position = UDim2.fromOffset(10, 22)
    instance44.BackgroundTransparency = 1
    instance44.Text = "FPS: 0  |  PING: 0ms"
    instance44.TextColor3 = Color3.fromRGB(170, 210, 175)
    instance44.Font = Enum.Font.GothamBold
    instance44.TextSize = 10
    instance44.TextXAlignment = Enum.TextXAlignment.Left
    instance44.ZIndex = 92

    local instance45 = Instance.new("TextLabel", stealBar2)
    instance45.Size = UDim2.new(0.5, -10, 0, 13)
    instance45.Position = UDim2.new(0.5, 0, 0, 22)
    instance45.BackgroundTransparency = 1
    instance45.Text = "discord.gg/mwvanehub"
    instance45.TextColor3 = Color3.fromRGB(190, 235, 195)
    instance45.Font = Enum.Font.GothamBold
    instance45.TextSize = 10
    instance45.TextXAlignment = Enum.TextXAlignment.Right
    instance45.ZIndex = 92

    local instance46 = Instance.new("Frame", stealBar2)
    instance46.Size = UDim2.new(1, -20, 0, 10)
    instance46.Position = UDim2.new(0, 10, 1, -17)
    instance46.BackgroundColor3 = Color3.fromRGB(2, 35, 10)
    instance46.BorderSizePixel = 0
    instance46.ZIndex = 92

    Instance.new("UICorner", instance46).CornerRadius = UDim.new(0, 4)

    local instance47 = Instance.new("Frame", instance46)
    instance47.Size = UDim2.fromScale(0, 1)
    instance47.BackgroundColor3 = Color3.fromRGB(5, 65, 20)
    instance47.BorderSizePixel = 0
    instance47.ZIndex = 93

    Instance.new("UICorner", instance47).CornerRadius = UDim.new(0, 4)
    v77 = instance47
    v78 = instance42
    v151 = instance43
    local v183 = 0
    local v184 = 0
    local v185 = 0
    local v186 = tick()

    runService.RenderStepped:Connect(function()
      v185 = v185 + 1
      instance43.Text = "Radius: " .. tostring(v44:getRadius())
      instance44.Text = string.format("FPS: %d  ·  PING: %dms  ·  mwvane hub", v183, v184)
      local v187

      if false and tick() - 0 < 1.5 then
        v187 = 1
      else
        v187 = 0
      end

      instance47.Size = UDim2.new(v187, 0, 1, 0)

      if false and tick() - 0 < 1.5 then
        instance42.Text = "● "
      else
        instance42.Text = "● " .. (v44.AutoStealEnabled and "READY" or "IDLE")
      end
    end)

    task.spawn(function()
      while task.wait(1) do
        local v188 = tick()
        local v189 = v188 - v186
        v183 = v189 > 0 and math.floor(v185 / v189) or 0
        v185 = 0
        v186 = v188
        local v190 = 0

        pcall(function()
          local dataPing = statsService.Network.ServerStatsItem:FindFirstChild("Data Ping")

          if dataPing then
            v190 = math.floor(dataPing:GetValue())
          end
        end)

        v184 = v190 or 0
      end
    end)

    f91("Speed", "Speed")
    local v191 = f92(32)
    f90(v191, "Normal Speed")

    v152 = f86(v191, normalSpeed, 50, 48, function(p89)
      if p89 > 0 and p89 <= 500 then
        normalSpeed = p89
      end

      f76()
    end)

    local v192 = f92(32)
    f90(v192, "Carry Speed")

    v153 = f86(v192, carrySpeed, 50, 48, function(p90)
      if p90 > 0 and p90 <= 500 then
        carrySpeed = p90
      end

      f76()
    end)

    local v193 = f92(32)
    f90(v193, "Lagger Normal Speed")

    v154 = f86(v193, laggerSpeed, 50, 48, function(p91)
      if p91 > 0 and p91 <= 500 then
        laggerSpeed = p91
      end

      f76()
    end)

    local v194 = f92(32)
    f90(v194, "Lagger Carry Speed")

    v155 = f86(v194, laggerCarrySpeed, 50, 48, function(p92)
      if p92 > 0 and p92 <= 500 then
        laggerCarrySpeed = p92
      end

      f76()
    end)

    local v195 = f92(32)
    f90(v195, "Mode")

    instance11 = Instance.new("TextLabel", v195)
    instance11.Size = UDim2.new(0, 90, 1, 0)
    instance11.Position = UDim2.new(1, -94, 0, 0)
    instance11.BackgroundTransparency = 1
    instance11.Text = "Normal"
    instance11.TextColor3 = color5
    instance11.Font = Enum.Font.GothamBlack
    instance11.TextSize = 11
    instance11.TextXAlignment = Enum.TextXAlignment.Right

    local instance48 = Instance.new("TextButton", v195)
    instance48.Size = UDim2.new(1, 0, 1, 0)
    instance48.BackgroundTransparency = 1
    instance48.Text = ""
    instance48.ZIndex = 2

    instance48.Activated:Connect(function()
      if v19 then
        return
      end

      f81()
      f76()
    end)

    f91("Keybinds", "Speed")
    local v196 = f92(32)
    f90(v196, "Speed Key")

    f98(v196, v43.SpeedToggle, function(p93, p94)
      if p94 then
        v43.SpeedToggle.gp = p93
        v43.SpeedToggle.kb = nil
      else
        v43.SpeedToggle.kb = p93
        v43.SpeedToggle.gp = nil
      end

      f76()
    end)

    local v197 = f92(32)
    f90(v197, "Lagger Key")

    f98(v197, v43.LaggerToggle, function(p95, p96)
      if p96 then
        v43.LaggerToggle.gp = p95
        v43.LaggerToggle.kb = nil
      else
        v43.LaggerToggle.kb = p95
        v43.LaggerToggle.gp = nil
      end

      f76()
    end)

    f91("Combat", "Combat")

    _G.setAutoSwingVisual = f93("Auto Swing", function(p97)
      v14 = p97
      f76()
    end)

    if _G.setAutoSwingVisual then
      _G.setAutoSwingVisual(v14)
    end

    f91("Auto Bat", "Bat")
    local v198 = f92(32)
    f90(v198, "Auto Bat")

    f98(v198, v43.AutoBat, function(p98, p99)
      if p99 then
        v43.AutoBat.gp = p98
        v43.AutoBat.kb = nil
      else
        v43.AutoBat.kb = p98
        v43.AutoBat.gp = nil
      end

      f76()
    end)

    local v199, v200 = f87(v198, 102)
    v199.ZIndex = 3

    v200.ZIndex = 4
    local v201 = false

    local function f102(p100)
      v201 = p100
      f88(v199, v200, p100)
    end

    v106 = f102

    local instance49 = Instance.new("TextButton", v199)
    instance49.Size = UDim2.new(1, 0, 1, 0)
    instance49.BackgroundTransparency = 1
    instance49.Text = ""
    instance49.ZIndex = 5

    instance49.Activated:Connect(function()
      if v19 then
        return
      end

      v201 = not v201
      f102(v201)

      if v201 then
        f73()
      else
        v13 = false
        f72()
      end

      f76()
    end)

    f91("MwVane TP Bat", "Bat")
    local v202 = f92(32)
    f90(v202, "MwVane TP Bat")

    f98(v202, v43.TPBat, function(p101, p102)
      if p102 then
        v43.TPBat.gp = p101
        v43.TPBat.kb = nil
      else
        v43.TPBat.kb = p101
        v43.TPBat.gp = nil
      end

      f76()
    end)

    local v203, v204 = f87(v202, 102)
    v203.ZIndex = 3

    v204.ZIndex = 4
    local v205 = false

    local function f103(p103)
      v205 = p103
      f88(v203, v204, p103)
    end

    local instance50 = Instance.new("TextButton", v203)
    instance50.Size = UDim2.new(1, 0, 1, 0)
    instance50.BackgroundTransparency = 1
    instance50.Text = ""
    instance50.ZIndex = 5

    instance50.Activated:Connect(function()
      if v19 then
        return
      end

      v205 = not v205
      f103(v205)
      _G.mwvaneTPBatToggled = v205

      if _G.mwvaneTPBatToggled then
        _G.startMwVaneTPBat()
      else
        _G.stopMwVaneTPBat()
      end

      f76()
    end)

    local v206 = f92(32)
    f90(v206, "Range")

    f86(v206, _G.MWVANE_TP_BAT_RANGE, 50, 56, function(p104)
      if p104 >= 10 and p104 <= 1000 then
        _G.MWVANE_TP_BAT_RANGE = p104
        f76()
      end
    end)

    f91("Bat Counter", "Bat")

    v146 = f93("Bat Counter", function(p105)
      v6 = p105

      if p105 then
        f70()
      else
        f68()
      end

      f76()
    end)

    f91("Steal", "Combat")
    local v207 = f92(32)
    f90(v207, "Radius")

    v156 = f86(v207, v44:getRadius(), 50, 56, function(p106)
      if p106 >= 0.5 and p106 <= 300 then
        v44.Modes[v44.StealMode].StealRadius = p106

        if v151 then
          v151.Text = string.format("Radius: %.2g", v44:getRadius())
        end
      end

      f76()
    end)

    local v208 = f92(32)
    f90(v208, "Steal Duration")

    local v209 = f86(v208, v44:getDuration(), 60, 66, function(p107)
      if p107 >= 0.1 and p107 <= 10 then
        v44.Modes[v44.StealMode].StealDuration = p107
      end

      f76()
    end)

    v209.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v209.TextColor3 = Color3.fromRGB(0, 0, 0)
    v209.TextStrokeTransparency = 1

    _G._stealDurationBox = v209
    local v210 = f92(32)
    f90(v210, "Auto Steal")
    local v211, v212 = f87(v210, 42)
    local v213 = false

    local function f104(p108)
      v213 = p108
      f88(v211, v212, p108)
    end

    _G.setInstaGrab = f104

    local instance51 = Instance.new("TextButton", v211)
    instance51.Size = UDim2.new(1, 0, 1, 0)
    instance51.BackgroundTransparency = 1
    instance51.Text = ""
    instance51.ZIndex = 5

    instance51.Activated:Connect(function()
      v213 = not v213
      f104(v213)
      v44.AutoStealEnabled = v213

      if v213 then
        if not pcall(f32) then
          v44.AutoStealEnabled = false
          f104(false)
        end
      else
        f28()
      end

      f76()
    end)

    v211.ZIndex = 3
    v212.ZIndex = 4

    local instance52 = Instance.new("Frame", v210)
    instance52.Size = UDim2.new(0, 30, 0, 24)
    instance52.Position = UDim2.new(1, -85, 0.5, -12)
    instance52.BackgroundColor3 = Color3.fromRGB(18, 30, 20)
    instance52.BackgroundTransparency = 0.5

    Instance.new("UICorner", instance52).CornerRadius = UDim.new(0, 6)

    local instance53 = Instance.new("TextLabel", instance52)
    instance53.Size = UDim2.new(1, 0, 1, 0)
    instance53.BackgroundTransparency = 1
    instance53.Text = "▼"
    instance53.TextColor3 = Color3.fromRGB(255, 255, 255)
    instance53.Font = Enum.Font.GothamBold
    instance53.TextSize = 8

    _G._stealChevronIcon = instance53

    local instance54 = Instance.new("TextButton", instance52)
    instance54.Size = UDim2.new(1, 0, 1, 0)
    instance54.BackgroundTransparency = 1
    instance54.Text = ""
    instance54.ZIndex = 6

    local stealModeTabs = f92(36)
    stealModeTabs.Name = "StealModeTabs"
    stealModeTabs.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    stealModeTabs.Visible = false
    stealModeTabs.LayoutOrder = v210.LayoutOrder + 1

    local instance55 = Instance.new("UIListLayout", stealModeTabs)
    instance55.FillDirection = Enum.FillDirection.Horizontal
    instance55.HorizontalAlignment = Enum.HorizontalAlignment.Center
    instance55.VerticalAlignment = Enum.VerticalAlignment.Center
    instance55.Padding = UDim.new(0, 8)

    local function f105(p109)
      local instance56 = Instance.new("TextButton", stealModeTabs)
      instance56.Size = UDim2.new(0.46, 0, 0, 26)
      instance56.BackgroundColor3 = Color3.fromRGB(15, 28, 18)
      instance56.Text = p109:upper()
      instance56.TextColor3 = Color3.fromRGB(150, 220, 165)
      instance56.Font = Enum.Font.GothamBold
      instance56.TextSize = 10

      Instance.new("UICorner", instance56).CornerRadius = UDim.new(0, 8)

      local function f106()
        local v214 = v44.StealMode == p109

        instance56.BackgroundColor3 = v214 and Color3.fromRGB(40, 200, 90)
          or Color3.fromRGB(15, 28, 18)

        instance56.TextColor3 = v214 and Color3.fromRGB(255, 255, 255)
          or Color3.fromRGB(150, 220, 165)
      end

      instance56.ZIndex = 10

      instance56.MouseButton1Click:Connect(function()
        v44:setMode(p109)

        if p109 == "Normal" then
          if v156 then
            v156.Text = tostring(60)
          end

          if _G._stealDurationBox then
            _G._stealDurationBox.Text = tostring(1.4)
          end
        else
          if v156 then
            v156.Text = tostring(9)
          end

          if _G._stealDurationBox then
            _G._stealDurationBox.Text = tostring(1.1)
          end
        end

        f76()

        for index40, value49 in ipairs(stealModeTabs:GetChildren()) do
          if value49:IsA("TextButton") then
            local v215 = value49.Text == "NORMAL" and p109 == "Normal"

            local v216 = v215
            v216 = v215 or value49.Text == "SEMI" and p109 == "Semi"

            value49.BackgroundColor3 = v216 and Color3.fromRGB(40, 200, 90)
              or Color3.fromRGB(15, 28, 18)

            value49.TextColor3 = v216 and Color3.fromRGB(255, 255, 255)
              or Color3.fromRGB(150, 220, 165)
          end
        end
      end)

      f106()
      return instance56
    end

    f105("Normal")
    f105("Semi")

    instance54.Activated:Connect(function()
      stealModeTabs.Visible = not stealModeTabs.Visible
      instance53.Text = stealModeTabs.Visible and "▲" or "▼"
    end)

    f91("Combat Abilities", "Combat")

    f93("Player ESP", function(p110)
      _G.espEnabled = p110
      _G.lineEspEnabled = p110

      if not p110 then
        for key11, value50 in pairs(v48.esp) do
          local v217 = value50

          if v217.box then
            pcall(function() v217.box:Destroy() end)
          end

          if v217.line then
            pcall(function() v217.line:Remove() end)
          end
        end

        v48.esp = {}
      end

      f76()
    end)

    local v218 = f92(32)
    f90(v218, "Infinite Jump")
    local v219, v220 = f87(v218, 42)
    local v221 = false

    local function f107(p111)
      v221 = p111
      f88(v219, v220, p111)
    end

    function _G.setInfJumpVisual(p112)
      v221 = p112
      f107(p112)
      v3 = p112
    end

    local instance57 = Instance.new("TextButton", v219)
    instance57.Size = UDim2.new(1, 0, 1, 0)
    instance57.BackgroundTransparency = 1
    instance57.Text = ""
    instance57.ZIndex = 5

    instance57.Activated:Connect(function()
      v221 = not v221
      f107(v221)
      v3 = v221
      f76()
    end)

    v219.ZIndex = 3
    v220.ZIndex = 4

    local instance58 = Instance.new("Frame", v218)
    instance58.Size = UDim2.new(0, 30, 0, 24)
    instance58.Position = UDim2.new(1, -85, 0.5, -12)
    instance58.BackgroundColor3 = Color3.fromRGB(18, 30, 20)
    instance58.BackgroundTransparency = 0.5

    Instance.new("UICorner", instance58).CornerRadius = UDim.new(0, 6)

    local instance59 = Instance.new("TextLabel", instance58)
    instance59.Size = UDim2.new(1, 0, 1, 0)
    instance59.BackgroundTransparency = 1
    instance59.Text = "▼"
    instance59.TextColor3 = Color3.fromRGB(255, 255, 255)
    instance59.Font = Enum.Font.GothamBold
    instance59.TextSize = 8

    _G._jumpChevronIcon = instance59

    local instance60 = Instance.new("TextButton", instance58)
    instance60.Size = UDim2.new(1, 0, 1, 0)
    instance60.BackgroundTransparency = 1
    instance60.Text = ""
    instance60.ZIndex = 6

    local jumpModeTabs = f92(36)
    jumpModeTabs.Name = "JumpModeTabs"
    jumpModeTabs.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    jumpModeTabs.Visible = false
    jumpModeTabs.LayoutOrder = v218.LayoutOrder + 1

    local instance61 = Instance.new("UIListLayout", jumpModeTabs)
    instance61.FillDirection = Enum.FillDirection.Horizontal
    instance61.HorizontalAlignment = Enum.HorizontalAlignment.Center
    instance61.VerticalAlignment = Enum.VerticalAlignment.Center
    instance61.Padding = UDim.new(0, 8)

    local function f108(p113)
      local instance62 = Instance.new("TextButton", jumpModeTabs)
      instance62.Size = UDim2.new(0.46, 0, 0, 26)
      instance62.BackgroundColor3 = Color3.fromRGB(15, 28, 18)
      instance62.Text = p113:upper()
      instance62.TextColor3 = Color3.fromRGB(150, 220, 165)
      instance62.Font = Enum.Font.GothamBold
      instance62.TextSize = 10

      Instance.new("UICorner", instance62).CornerRadius = UDim.new(0, 8)

      local function f109()
        local v222 = lower == p113:lower()

        instance62.BackgroundColor3 = v222 and Color3.fromRGB(40, 200, 90)
          or Color3.fromRGB(15, 28, 18)

        instance62.TextColor3 = v222 and Color3.fromRGB(255, 255, 255)
          or Color3.fromRGB(150, 220, 165)
      end

      instance62.ZIndex = 10

      instance62.MouseButton1Click:Connect(function()
        lower = p113:lower()
        f76()

        for index41, value51 in ipairs(jumpModeTabs:GetChildren()) do
          if value51:IsA("TextButton") then
            local v223 = value51.Text == p113:upper()

            value51.BackgroundColor3 = v223 and Color3.fromRGB(40, 200, 90)
              or Color3.fromRGB(15, 28, 18)

            value51.TextColor3 = v223 and Color3.fromRGB(255, 255, 255)
              or Color3.fromRGB(150, 220, 165)
          end
        end
      end)

      f109()
      return instance62
    end

    f108("Manual")
    f108("Hold")

    instance60.Activated:Connect(function()
      jumpModeTabs.Visible = not jumpModeTabs.Visible
      instance59.Text = jumpModeTabs.Visible and "▲" or "▼"
    end)

    _G.setAntiRagVisual = f93("Anti Ragdoll", function(p114)
      v2 = p114

      if p114 then
        f15()
      else
        f11()
      end
    end)

    local v224 = f92(32)
    f90(v224, "Medusa Counter")
    local v225, v226 = f87(v224, 42)
    local v227 = false

    local function f110(p115)
      v227 = p115
      f88(v225, v226, p115)
    end

    _G.setMedusaVisual = f110

    local instance63 = Instance.new("TextButton", v225)
    instance63.Size = UDim2.new(1, 0, 1, 0)
    instance63.BackgroundTransparency = 1
    instance63.Text = ""
    instance63.ZIndex = 5

    instance63.Activated:Connect(function()
      v227 = not v227
      f110(v227)
      v5 = v227

      if v227 then
        f65(localPlayer.Character)
      else
        f61()
      end

      f76()
    end)

    v225.ZIndex = 3
    v226.ZIndex = 4

    _G.setUnwalkVisual = f93("Unwalk", function(p116)
      v7 = p116

      if p116 then
        f38()
      else
        f39()
      end
    end)

    v149 = f93("Tryhard Animation", function(p117)
      v18 = p117

      if p117 then
        f47()
      else
        f48()
      end
    end)

    local v228 = f92(32)
    f90(v228, "Drop Brainrot")

    f98(v228, v43.DropBrainrot, function(p118, p119)
      if p119 then
        v43.DropBrainrot.gp = p118
        v43.DropBrainrot.kb = nil
      else
        v43.DropBrainrot.kb = p118
        v43.DropBrainrot.gp = nil
      end

      f76()
    end)

    local instance64 = Instance.new("TextButton", v228)
    instance64.Size = UDim2.new(0.58, 0, 1, 0)
    instance64.BackgroundTransparency = 1
    instance64.Text = ""
    instance64.ZIndex = 2
    instance64.Activated:Connect(function() f52() end)

    f91("Teleport", "Combat")
    local v229 = f92(32)
    f90(v229, "TP Down")

    f98(v229, v43.TPFloor, function(p120, p121)
      if p121 then
        v43.TPFloor.gp = p120
        v43.TPFloor.kb = nil
      else
        v43.TPFloor.kb = p120
        v43.TPFloor.gp = nil
      end

      f76()
    end)

    local instance65 = Instance.new("TextButton", v229)
    instance65.Size = UDim2.new(0.58, 0, 1, 0)
    instance65.BackgroundTransparency = 1
    instance65.Text = ""
    instance65.ZIndex = 2
    instance65.Activated:Connect(function() end)

    v130 = f93("Auto TP", function(p122)
      v20 = p122

      if p122 then
        f54()
      else
        f55()
      end

      f76()
    end)

    local v230 = f92(32)
    f90(v230, "Auto TP Height")

    v157 = f86(v230, autoTPHeight, 50, 56, function(p123)
      if p123 >= 0 and p123 <= 500 then
        autoTPHeight = p123
      else
        v157.Text = tostring(autoTPHeight)
      end

      f76()
    end)

    f91("Visual", "Visual")

    v147 = f93("Anti Lag", function(p124)
      antiLag = p124
      f76()
    end)

    v148 = f93("Stretch Rez", function(p125)
      if p125 then
        f50()
      else
        f49()
      end

      f76()
    end)

    f91("Sky Themes", "Visual")
    local v231 = f92(32)
    f90(v231, "Sky Theme")
    local v232 = 1
    local candyHubSkyMode = _G._CandyHubSkyMode or "Off"

    for index42, value52 in ipairs(v121) do
      if value52[2] == candyHubSkyMode then
        v232 = index42
        break
      end
    end

    local instance66 = Instance.new("TextLabel", v231)
    instance66.Size = UDim2.new(0, 150, 1, 0)
    instance66.Position = UDim2.new(1, -158, 0, 0)
    instance66.BackgroundTransparency = 1
    instance66.Text = v121[v232][2]
    instance66.TextColor3 = color5
    instance66.Font = Enum.Font.GothamBlack
    instance66.TextSize = 11
    instance66.TextXAlignment = Enum.TextXAlignment.Right
    instance66.ZIndex = 3

    local instance67 = Instance.new("TextButton", v231)
    instance67.Size = UDim2.new(1, 0, 1, 0)
    instance67.BackgroundTransparency = 1
    instance67.Text = ""
    instance67.ZIndex = 2

    instance67.Activated:Connect(function()
      v232 = v232 % #v121 + 1
      local v233 = v121[v232][2]
      instance66.Text = v233
      f60(v233)
      f76()
    end)

    f91("Movement", "Speed")

    v90 = f100("Auto Left", v43.AutoLeft, function(p126)
      v11 = p126

      if p126 then
        f74()
      else
        f35()
      end
    end, function(p127, p128)
      if p128 then
        v43.AutoLeft.gp = p127
        v43.AutoLeft.kb = nil
      else
        v43.AutoLeft.kb = p127
        v43.AutoLeft.gp = nil
      end

      f76()
    end)

    v89 = f100("Auto Right", v43.AutoRight, function(p129)
      v12 = p129

      if p129 then
        f75()
      else
        f34()
      end
    end, function(p130, p131)
      if p131 then
        v43.AutoRight.gp = p130
        v43.AutoRight.kb = nil
      else
        v43.AutoRight.kb = p130
        v43.AutoRight.gp = nil
      end

      f76()
    end)

    f91("Skin Changer", "Visual")
    local v234 = {}

    for key12 in pairs(v24) do
      table.insert(v234, key12)
    end

    table.sort(v234)
    local v235 = 1

    for index43, value53 in ipairs(v234) do
      if value53 == v22 then
        v235 = index43
        break
      end
    end

    local v236 = f92(32)
    f90(v236, "Anim Pack")

    local instance68 = Instance.new("TextLabel", v236)
    instance68.Size = UDim2.new(0, 120, 1, 0)
    instance68.Position = UDim2.new(1, -128, 0, 0)
    instance68.BackgroundTransparency = 1
    instance68.Text = v234[v235]
    instance68.TextColor3 = color5
    instance68.Font = Enum.Font.GothamBlack
    instance68.TextSize = 9
    instance68.TextXAlignment = Enum.TextXAlignment.Right
    instance68.ZIndex = 3

    local instance69 = Instance.new("TextButton", v236)
    instance69.Size = UDim2.new(1, 0, 1, 0)
    instance69.BackgroundTransparency = 1
    instance69.Text = ""
    instance69.ZIndex = 2

    instance69.Activated:Connect(function()
      v235 = v235 % #v234 + 1
      v22 = v234[v235]
      instance68.Text = v22

      if scAnimPackActive then
        task.spawn(function() f5(v22, localPlayer.Character) end)
      end

      f76()
    end)

    local v237 = f93("Enable Anim Pack", function(p132)
      scAnimPackActive = p132
      local character32, animate6

      if p132 then
        task.spawn(function() f5(v22, localPlayer.Character) end)
      else
        character32 = localPlayer.Character

        if character32 then
          animate6 = character32:FindFirstChild("Animate")

          if animate6 and (animate6:IsA("LocalScript") or animate6:IsA("Script")) then
            pcall(function()
              local animate7 = animate6:Clone()
              animate7.Disabled = true
              animate7.Parent = character32

              animate6:Destroy()

              animate7.Name = "Animate"
              animate7.Disabled = false

              runService.Heartbeat:Wait()
            end)
          end
        end
      end

      f76()
    end)

    if scAnimPackActive then
      v237(true)
    end

    local v238 = f93("Headless", function(p133)
      scHeadless = p133
      f4(localPlayer.Character, p133)
      f76()
    end)

    if scHeadless then
      v238(true)
    end

    local v239 = f93("Korblox", function(p134)
      scKorblox = p134
      f3(localPlayer.Character, p134)
      f76()
    end)

    if scKorblox then
      v239(true)
    end

    local v240 = { "Default", "Outfit 1", "Outfit 2", "Outfit 3" }
    local v241 = 1

    for index44, value54 in ipairs(v240) do
      if value54 == scOutfit then
        v241 = index44
        break
      end
    end

    local v242 = f92(32)
    f90(v242, "Outfit")

    local instance70 = Instance.new("TextLabel", v242)
    instance70.Size = UDim2.new(0, 100, 1, 0)
    instance70.Position = UDim2.new(1, -108, 0, 0)
    instance70.BackgroundTransparency = 1
    instance70.Text = v240[v241]
    instance70.TextColor3 = color5
    instance70.Font = Enum.Font.GothamBlack
    instance70.TextSize = 10
    instance70.TextXAlignment = Enum.TextXAlignment.Right
    instance70.ZIndex = 3

    local instance71 = Instance.new("TextButton", v242)
    instance71.Size = UDim2.new(1, 0, 1, 0)
    instance71.BackgroundTransparency = 1
    instance71.Text = ""
    instance71.ZIndex = 2

    instance71.Activated:Connect(function()
      v241 = v241 % #v240 + 1
      scOutfit = v240[v241]
      instance70.Text = scOutfit
      f8(localPlayer.Character, scOutfit)
      f76()
    end)

    f91("Interface", "Config")
    local v243 = f92(32)
    f90(v243, "Hide UI")

    f98(v243, v43.GuiHide, function(p135, p136)
      if p136 then
        v43.GuiHide.gp = p135
        v43.GuiHide.kb = nil
      else
        v43.GuiHide.kb = p135
        v43.GuiHide.gp = nil
      end

      f76()
    end)

    v150 = f93("Lock UI", function(p137)
      v21 = p137
      f76()
    end)

    userInputService.InputBegan:Connect(function(input7, p138)
      if v19 then
        return
      elseif input7.UserInputType == Enum.UserInputType.Keyboard then
        if p138 or userInputService:GetFocusedTextBox() then
          return
        elseif not f97(input7) then
          return
        else
          local keyCode = input7.KeyCode

          if f96(v43.LaggerToggle, keyCode) then
            f80()
            f76()
          elseif f96(v43.SpeedToggle, keyCode) then
            f81()
            f76()
          elseif f96(v43.DropBrainrot, keyCode) then
            f52()
          elseif f96(v43.TPFloor, keyCode) then
          elseif f96(v43.AutoLeft, keyCode) then
            v11 = not v11

            if v11 then
              f74()
            else
              f35()
            end

            if v90 then
              v90(v11)
            end
          elseif f96(v43.AutoRight, keyCode) then
            v12 = not v12

            if v12 then
              f75()
            else
              f34()
            end

            if v89 then
              v89(v12)
            end
          elseif f96(v43.AutoBat, keyCode) then
            if not v13 then
              f73()

              if v106 then
                v106(true)
              end
            else
              v13 = false
              f72()

              if v106 then
                v106(false)
              end
            end
          elseif f96(v43.TPBat, keyCode) then
            _G.mwvaneTPBatToggled = not _G.mwvaneTPBatToggled

            if _G.mwvaneTPBatToggled then
              _G.startMwVaneTPBat()
            else
              _G.stopMwVaneTPBat()
            end

            if f103 then
              f103(_G.mwvaneTPBatToggled)
            end
          elseif f96(v43.GuiHide, keyCode) then
            f84(not v160)
          end

          return
        end
      elseif not f95(input7) then
        return
      elseif not f97(input7) then
        return
      else
        local keyCode2 = input7.KeyCode

        if f96(v43.LaggerToggle, keyCode2) then
          f80()
          f76()
        elseif f96(v43.SpeedToggle, keyCode2) then
          f81()
          f76()
        elseif f96(v43.DropBrainrot, keyCode2) then
          f52()
        elseif f96(v43.TPFloor, keyCode2) then
        elseif f96(v43.AutoLeft, keyCode2) then
          v11 = not v11

          if v11 then
            f74()
          else
            f35()
          end

          if v90 then
            v90(v11)
          end
        elseif f96(v43.AutoRight, keyCode2) then
          v12 = not v12

          if v12 then
            f75()
          else
            f34()
          end

          if v89 then
            v89(v12)
          end
        elseif f96(v43.AutoBat, keyCode2) then
          if not v13 then
            f73()

            if v106 then
              v106(true)
            end
          else
            v13 = false
            f72()

            if v106 then
              v106(false)
            end
          end
        elseif f96(v43.TPBat, keyCode2) then
          _G.mwvaneTPBatToggled = not _G.mwvaneTPBatToggled

          if _G.mwvaneTPBatToggled then
            _G.startMwVaneTPBat()
          else
            _G.stopMwVaneTPBat()
          end

          if f103 then
            f103(_G.mwvaneTPBatToggled)
          end
        elseif f96(v43.GuiHide, keyCode2) then
          f84(not v160)
        end

        return
      end
    end)
  end

  local function f111()
    if not (isfile and isfile("fadeaway_settings.json")) then
      return
    else
      local v244, v245 = pcall(function()
        return httpService:JSONDecode(readfile("fadeaway_settings.json"))
      end)

      if not v244 or not v245 then
        return
      else
        local function f112(p139, p140)
          if type(p140) ~= "table" then
            return
          end

          if p140.kb and Enum.KeyCode[p140.kb] then
            p139.kb = Enum.KeyCode[p140.kb]
          end

          if p140.gp and Enum.KeyCode[p140.gp] then
            p139.gp = Enum.KeyCode[p140.gp]
          end
        end

        v158 = v245

        f112(v43.DropBrainrot, v245.dropBrainrotKey)
        f112(v43.AutoLeft, v245.autoLeftKey)
        f112(v43.AutoRight, v245.autoRightKey)
        f112(v43.AutoBat, v245.autoBatKey)
        f112(v43.TPBat, v245.mwvaneTPBatKey)
        f112(v43.LaggerToggle, v245.laggerToggleKey)

        if not v245.mwvaneTPBatKey then
          f112(v43.TPBat, v245.batV2Key or v245.candyTPBatKey)
        end

        f112(v43.TPFloor, v245.tpFloorKey)
        f112(v43.GuiHide, v245.guiHideKey)
        f112(v43.SpeedToggle, v245.speedToggleKey)

        if v245.normalSpeed then
          normalSpeed = v245.normalSpeed
        end

        if v245.carrySpeed then
          carrySpeed = v245.carrySpeed
        end

        if v245.stealMode then
          v44:setMode(v245.stealMode)
        else
          v44:setMode("Normal")
        end

        if v245.grabRadius and type(v245.grabRadius) == "number" then
          v44.Modes[v44.StealMode].StealRadius = v245.grabRadius
        end

        if v245.stealDuration and type(v245.stealDuration) == "number" then
          v44.Modes[v44.StealMode].StealDuration = v245.stealDuration
        end

        if v245.laggerSpeed and type(v245.laggerSpeed) == "number" then
          laggerSpeed = v245.laggerSpeed
        end

        if v245.laggerCarrySpeed and type(v245.laggerCarrySpeed) == "number" then
          laggerCarrySpeed = v245.laggerCarrySpeed
        end

        if v245.mwvaneTPBatRange and type(v245.mwvaneTPBatRange) == "number" then
          _G.MWVANE_TP_BAT_RANGE = v245.mwvaneTPBatRange
        elseif v245.candyTPBatRange and type(v245.candyTPBatRange) == "number" then
          _G.MWVANE_TP_BAT_RANGE = v245.candyTPBatRange
        elseif v245.batV2Speed and type(v245.batV2Speed) == "number" then
          _G.MWVANE_TP_BAT_RANGE = v245.batV2Speed
        end

        if v245.autoTPHeight and type(v245.autoTPHeight) == "number" then
          autoTPHeight = v245.autoTPHeight
        end

        if v245.autoSwing ~= nil then
          v14 = v245.autoSwing == true
        end

        if type(v245.selectedBgIndex) == "number" then
          _G.selectedBgIndex = v245.selectedBgIndex
        end

        if type(v245.skyTheme) == "string" then
          for index45, value55 in ipairs(v121) do
            if value55[2] == v245.skyTheme then
              break
            end
          end
        end

        return
      end
    end
  end

  f111()

  f82()
  f79()
end

print("mwvane hub Loaded")

-- https://discord.gg/AwGHNh7Z7T
