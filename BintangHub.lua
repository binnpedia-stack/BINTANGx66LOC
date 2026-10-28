-- BINTANGHUB | Leenz UI Replicated
-- Auto Skillcheck (Legit/Normal/Instant) + Full Features

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = {
    AutoSkill = false, SkillMode = "Legit", BypassGen = "Manual Repair", GeneBoost = false, AutoTrapSkill = false,
    GodMode = false, DodgeSlash = false, UnlimitedVault = false, FastVault = false, NoCDFlow = false, NoFallDamage = false,
    ExiteGateGhost = false, SelfHeal = false, InstanEscape = false,
    SilentAimTOF = false, PredictTOF = false, BlockAimKnocked = false, Wallcheck = false, LaserEffect = false,
    SilentAimFlash = false, FlashHeadOffset = 8,
    KillerAimbot = false, MeleeLockDist = 12, AimbotSmooth = 5, AntiBlind = false, NoSlowdown = false,
    InfinityLunge = false, AimLockHidden = false,
    SilentVeilOP = false, Tracer = false, ShowFOV = false, FOVRadius = 400,
    SilentAimFlask = false, EnableLaserKiller = false,
    ESP_Enable = false, ESP_Survivor = false, ESP_PlayerColor = Color3.fromRGB(170, 0, 255),
    ESP_Killer = false, ESP_KillerColor = Color3.fromRGB(255, 0, 0),
    ESP_Outline = false, ESP_HookCount = false, ESP_Name = false, ESP_Distance = false, ESP_Health = false,
    ESP_Zombie = false, ESP_SCPColor = Color3.fromRGB(255, 255, 0), ESP_ItemIcon = false, ESP_KillerWarn = false,
    ESP_Gen = false, ESP_GenColor = Color3.fromRGB(255, 255, 255), ESP_GenNameProgress = false,
    ESP_Pallet = false, ESP_PalletColor = Color3.fromRGB(0, 255, 0),
    ESP_Window = false, ESP_WindowColor = Color3.fromRGB(255, 255, 255),
    ESP_Hook = false, ESP_HookColor = Color3.fromRGB(0, 255, 0),
    ESP_Trap = false, ESP_TrapColor = Color3.fromRGB(255, 255, 255),
    ESP_Pumpkin = false, ESP_PumpkinColor = Color3.fromRGB(255, 165, 0),
    FullBright = false, NoFog = false, NoShadow = false, LowGrafik = false, CleanSky = false, TimeOfDay = 14,
    InfoFPS = false, InfoNextKiller = false, InfoNextMap = false, InfoStun = false, InfoKillerPerks = false,
    TP_Player = "None",
    SelfUnhook = false, FastBandage = false, Crosshair = false, CrosshairColor = Color3.fromRGB(255, 255, 0), CrosshairStyle = "Dot",
    MaxZoom = false, KillerRadar = false, CameraFOV = false, FOVValue = 90, ThirdPersonKiller = false, DBDCamera = false, DBDDistance = 3, CustScale = 1,
    FakeQuickRecovery = false, FakePerfectLanding = false, FakeFlowstate = false, FakeAdrenaline = false, PerksCooldown = 10,
    AutoVault = false,
    ToolsJerk = false, CopyAvatar = false, FlyGUI = false, Noclip = false, ApplyKorless = false, SpeedBoost = false, SpeedVal = 2
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "BINTANGHUB",
   LoadingTitle = "BINTANGHUB",
   LoadingSubtitle = "by BintangHub",
   KeySystem = false, Theme = "DarkBlue"
})

local TabExclusive = Window:CreateTab("Exclusive", 4483362458)
TabExclusive:CreateSection("Utility")
TabExclusive:CreateToggle({Name = "Self Unhook GUI", CurrentValue = Config.SelfUnhook, Flag = "SelfUnhook", Callback = function(v) Config.SelfUnhook = v end})
TabExclusive:CreateToggle({Name = "Fast Bandage GUI", CurrentValue = Config.FastBandage, Flag = "FastBandage", Callback = function(v) Config.FastBandage = v end})
TabExclusive:CreateSection("Crosshair")
TabExclusive:CreateToggle({Name = "Enable Crosshair", CurrentValue = Config.Crosshair, Flag = "Crosshair", Callback = function(v) Config.Crosshair = v end})
TabExclusive:CreateColorPicker({Name = "Crosshair Color", Color = Config.CrosshairColor, Flag = "CrosshairColor", Callback = function(v) Config.CrosshairColor = v end})
TabExclusive:CreateDropdown({Name = "Style", Options = {"Dot", "Cross", "Circle"}, CurrentOption = {"Dot"}, Flag = "CrosshairStyle", Callback = function(o) Config.CrosshairStyle = o[1] end})
TabExclusive:CreateSection("Camera")
TabExclusive:CreateToggle({Name = "Max Zoom", CurrentValue = Config.MaxZoom, Flag = "MaxZoom", Callback = function(v) Config.MaxZoom = v end})
TabExclusive:CreateToggle({Name = "Killer Radar", CurrentValue = Config.KillerRadar, Flag = "KillerRadar", Callback = function(v) Config.KillerRadar = v end})
TabExclusive:CreateToggle({Name = "Camera FOV", CurrentValue = Config.CameraFOV, Flag = "CameraFOV", Callback = function(v) Config.CameraFOV = v end})
TabExclusive:CreateSlider({Name = "FOV Value", Range = {70, 120}, Increment = 1, CurrentValue = 90, Flag = "FOVValue", Callback = function(v) Config.FOVValue = v end})
TabExclusive:CreateToggle({Name = "Third Person (Killer)", CurrentValue = Config.ThirdPersonKiller, Flag = "ThirdPersonKiller", Callback = function(v) Config.ThirdPersonKiller = v end})
TabExclusive:CreateToggle({Name = "DBD Camera", CurrentValue = Config.DBDCamera, Flag = "DBDCamera", Callback = function(v) Config.DBDCamera = v end})
TabExclusive:CreateSlider({Name = "DBD Camera Distance", Range = {1, 10}, Increment = 1, CurrentValue = 3, Flag = "DBDDistance", Callback = function(v) Config.DBDDistance = v end})
TabExclusive:CreateSlider({Name = "Custom Scale", Range = {1, 5}, Increment = 1, CurrentValue = 1, Flag = "CustScale", Callback = function(v) Config.CustScale = v end})
TabExclusive:CreateSection("Fake Perks")
TabExclusive:CreateToggle({Name = "Fake Quick Recovery", CurrentValue = Config.FakeQuickRecovery, Flag = "FakeQuickRecovery", Callback = function(v) Config.FakeQuickRecovery = v end})
TabExclusive:CreateToggle({Name = "Fake Perfect Landing", CurrentValue = Config.FakePerfectLanding, Flag = "FakePerfectLanding", Callback = function(v) Config.FakePerfectLanding = v end})
TabExclusive:CreateToggle({Name = "Fake Flowstate", CurrentValue = Config.FakeFlowstate, Flag = "FakeFlowstate", Callback = function(v) Config.FakeFlowstate = v end})
TabExclusive:CreateToggle({Name = "Fake Adrenaline Rush", CurrentValue = Config.FakeAdrenaline, Flag = "FakeAdrenaline", Callback = function(v) Config.FakeAdrenaline = v end})
TabExclusive:CreateSlider({Name = "Perks Cooldown (detik)", Range = {1, 60}, Increment = 1, CurrentValue = 10, Flag = "PerksCooldown", Callback = function(v) Config.PerksCooldown = v end})
TabExclusive:CreateSection("Movement")
TabExclusive:CreateToggle({Name = "Auto Vault", CurrentValue = Config.AutoVault, Flag = "AutoVault", Callback = function(v) Config.AutoVault = v end})

local TabSurvivor = Window:CreateTab("Survivor", 4483362458)
TabSurvivor:CreateSection("Skill Check Instant")
TabSurvivor:CreateToggle({Name = "Auto Skill Check", CurrentValue = Config.AutoSkill, Flag = "AutoSkill", Callback = function(v) Config.AutoSkill = v end})
TabSurvivor:CreateDropdown({Name = "Skill Check Mode", Options = {"Legit", "Normal", "Instan"}, CurrentOption = {"Legit"}, Flag = "SkillMode", Callback = function(o) Config.SkillMode = o[1] end})
TabSurvivor:CreateDropdown({Name = "Bypass Gen Mode", Options = {"Manual Repair", "Auto Repair"}, CurrentOption = {"Manual Repair"}, Flag = "BypassGen", Callback = function(o) Config.BypassGen = o[1] end})
TabSurvivor:CreateToggle({Name = "Gene Boost", CurrentValue = Config.GeneBoost, Flag = "GeneBoost", Callback = function(v) Config.GeneBoost = v end})
TabSurvivor:CreateToggle({Name = "Auto Skill Check Trap", CurrentValue = Config.AutoTrapSkill, Flag = "AutoTrapSkill", Callback = function(v) Config.AutoTrapSkill = v end})
TabSurvivor:CreateSection("Survivor Ability")
TabSurvivor:CreateToggle({Name = "God Mode (Anti Knock)", CurrentValue = Config.GodMode, Flag = "GodMode", Callback = function(v) Config.GodMode = v end})
TabSurvivor:CreateToggle({Name = "Dodge Slash Abys", CurrentValue = Config.DodgeSlash, Flag = "DodgeSlash", Callback = function(v) Config.DodgeSlash = v end})
TabSurvivor:CreateToggle({Name = "Unlimited Vault", CurrentValue = Config.UnlimitedVault, Flag = "UnlimitedVault", Callback = function(v) Config.UnlimitedVault = v end})
TabSurvivor:CreateToggle({Name = "Fast Vault (Anti Slow)", CurrentValue = Config.FastVault, Flag = "FastVault", Callback = function(v) Config.FastVault = v end})
TabSurvivor:CreateToggle({Name = "No CD Flowstate", CurrentValue = Config.NoCDFlow, Flag = "NoCDFlow", Callback = function(v) Config.NoCDFlow = v end})
TabSurvivor:CreateToggle({Name = "No Fall Damage", CurrentValue = Config.NoFallDamage, Flag = "NoFallDamage", Callback = function(v) Config.NoFallDamage = v end})
TabSurvivor:CreateToggle({Name = "Exite Gate Ghost", CurrentValue = Config.ExiteGateGhost, Flag = "ExiteGateGhost", Callback = function(v) Config.ExiteGateGhost = v end})
TabSurvivor:CreateToggle({Name = "Self Heal", CurrentValue = Config.SelfHeal, Flag = "SelfHeal", Callback = function(v) Config.SelfHeal = v end})
TabSurvivor:CreateToggle({Name = "Instan Escape", CurrentValue = Config.InstanEscape, Flag = "InstanEscape", Callback = function(v) Config.InstanEscape = v end})
TabSurvivor:CreateSection("Silent Aim Pistol")
TabSurvivor:CreateToggle({Name = "Silent Aim TOF", CurrentValue = Config.SilentAimTOF, Flag = "SilentAimTOF", Callback = function(v) Config.SilentAimTOF = v end})
TabSurvivor:CreateToggle({Name = "Predict Aim ToF", CurrentValue = Config.PredictTOF, Flag = "PredictTOF", Callback = function(v) Config.PredictTOF = v end})
TabSurvivor:CreateToggle({Name = "Block aim Knocked", CurrentValue = Config.BlockAimKnocked, Flag = "BlockAimKnocked", Callback = function(v) Config.BlockAimKnocked = v end})
TabSurvivor:CreateToggle({Name = "Wallcheck", CurrentValue = Config.Wallcheck, Flag = "Wallcheck", Callback = function(v) Config.Wallcheck = v end})
TabSurvivor:CreateToggle({Name = "Enable Laser Effect", CurrentValue = Config.LaserEffect, Flag = "LaserEffect", Callback = function(v) Config.LaserEffect = v end})
TabSurvivor:CreateSection("Flash Aim")
TabSurvivor:CreateToggle({Name = "Silent Aim (flash)", CurrentValue = Config.SilentAimFlash, Flag = "SilentAimFlash", Callback = function(v) Config.SilentAimFlash = v end})
TabSurvivor:CreateSlider({Name = "Flash Head Offset (Y)", Range = {1, 20}, Increment = 1, CurrentValue = 8, Flag = "FlashHeadOffset", Callback = function(v) Config.FlashHeadOffset = v end})

local TabKiller = Window:CreateTab("Killer", 4483362458)
TabKiller:CreateSection("Killer Ability")
TabKiller:CreateToggle({Name = "Enable Aimbot", CurrentValue = Config.KillerAimbot, Flag = "KillerAimbot", Callback = function(v) Config.KillerAimbot = v end})
TabKiller:CreateSlider({Name = "Melee Lock Distance", Range = {1, 30}, Increment = 1, CurrentValue = 12, Flag = "MeleeLockDist", Callback = function(v) Config.MeleeLockDist = v end})
TabKiller:CreateSlider({Name = "Aimbot Smoothness", Range = {1, 20}, Increment = 1, CurrentValue = 5, Flag = "AimbotSmooth", Callback = function(v) Config.AimbotSmooth = v end})
TabKiller:CreateToggle({Name = "Anti Blind (Flash)", CurrentValue = Config.AntiBlind, Flag = "AntiBlind", Callback = function(v) Config.AntiBlind = v end})
TabKiller:CreateToggle({Name = "No Slowdown", CurrentValue = Config.NoSlowdown, Flag = "NoSlowdown", Callback = function(v) Config.NoSlowdown = v end})
TabKiller:CreateToggle({Name = "Infinity Lunge", CurrentValue = Config.InfinityLunge, Flag = "InfinityLunge", Callback = function(v) Config.InfinityLunge = v end})
TabKiller:CreateToggle({Name = "Aim Lock Hidden", CurrentValue = Config.AimLockHidden, Flag = "AimLockHidden", Callback = function(v) Config.AimLockHidden = v end})
TabKiller:CreateSection("Veil Spear Silent Aim")
TabKiller:CreateToggle({Name = "Silent Veil OP", CurrentValue = Config.SilentVeilOP, Flag = "SilentVeilOP", Callback = function(v) Config.SilentVeilOP = v end})
TabKiller:CreateToggle({Name = "Tracer", CurrentValue = Config.Tracer, Flag = "Tracer", Callback = function(v) Config.Tracer = v end})
TabKiller:CreateToggle({Name = "Show FOV", CurrentValue = Config.ShowFOV, Flag = "ShowFOV", Callback = function(v) Config.ShowFOV = v end})
TabKiller:CreateSlider({Name = "FOV Radius", Range = {100, 800}, Increment = 10, CurrentValue = 400, Flag = "FOVRadius", Callback = function(v) Config.FOVRadius = v end})
TabKiller:CreateSection("Silent Aim Flask (Cure)")
TabKiller:CreateToggle({Name = "Silent Aim Flask (Cure)", CurrentValue = Config.SilentAimFlask, Flag = "SilentAimFlask", Callback = function(v) Config.SilentAimFlask = v end})
TabKiller:CreateToggle({Name = "Enable Laser", CurrentValue = Config.EnableLaserKiller, Flag = "EnableLaserKiller", Callback = function(v) Config.EnableLaserKiller = v end})

local TabESP = Window:CreateTab("ESP", 4483362458)
TabESP:CreateSection("ESP Players")
TabESP:CreateToggle({Name = "Enable Esp", CurrentValue = Config.ESP_Enable, Flag = "ESP_Enable", Callback = function(v) Config.ESP_Enable = v end})
TabESP:CreateToggle({Name = "Esp Survivor", CurrentValue = Config.ESP_Survivor, Flag = "ESP_Survivor", Callback = function(v) Config.ESP_Survivor = v end})
TabESP:CreateColorPicker({Name = "Player Color", Color = Config.ESP_PlayerColor, Flag = "ESP_PlayerColor", Callback = function(v) Config.ESP_PlayerColor = v end})
TabESP:CreateToggle({Name = "Esp Killer", CurrentValue = Config.ESP_Killer, Flag = "ESP_Killer", Callback = function(v) Config.ESP_Killer = v end})
TabESP:CreateColorPicker({Name = "Killer Color", Color = Config.ESP_KillerColor, Flag = "ESP_KillerColor", Callback = function(v) Config.ESP_KillerColor = v end})
TabESP:CreateToggle({Name = "Mode Outline", CurrentValue = Config.ESP_Outline, Flag = "ESP_Outline", Callback = function(v) Config.ESP_Outline = v end})
TabESP:CreateToggle({Name = "Esp Hook Count", CurrentValue = Config.ESP_HookCount, Flag = "ESP_HookCount", Callback = function(v) Config.ESP_HookCount = v end})
TabESP:CreateToggle({Name = "Esp Name", CurrentValue = Config.ESP_Name, Flag = "ESP_Name", Callback = function(v) Config.ESP_Name = v end})
TabESP:CreateToggle({Name = "Esp Distance", CurrentValue = Config.ESP_Distance, Flag = "ESP_Distance", Callback = function(v) Config.ESP_Distance = v end})
TabESP:CreateToggle({Name = "Esp Health State", CurrentValue = Config.ESP_Health, Flag = "ESP_Health", Callback = function(v) Config.ESP_Health = v end})
TabESP:CreateToggle({Name = "Esp Zombie", CurrentValue = Config.ESP_Zombie, Flag = "ESP_Zombie", Callback = function(v) Config.ESP_Zombie = v end})
TabESP:CreateColorPicker({Name = "SCP Color", Color = Config.ESP_SCPColor, Flag = "ESP_SCPColor", Callback = function(v) Config.ESP_SCPColor = v end})
TabESP:CreateToggle({Name = "Esp Item Icon", CurrentValue = Config.ESP_ItemIcon, Flag = "ESP_ItemIcon", Callback = function(v) Config.ESP_ItemIcon = v end})
TabESP:CreateToggle({Name = "Killer Warn", CurrentValue = Config.ESP_KillerWarn, Flag = "ESP_KillerWarn", Callback = function(v) Config.ESP_KillerWarn = v end})
TabESP:CreateSection("ESP Maps")
TabESP:CreateToggle({Name = "Generator", CurrentValue = Config.ESP_Gen, Flag = "ESP_Gen", Callback = function(v) Config.ESP_Gen = v end})
TabESP:CreateColorPicker({Name = "Generator Color", Color = Config.ESP_GenColor, Flag = "ESP_GenColor", Callback = function(v) Config.ESP_GenColor = v end})
TabESP:CreateToggle({Name = "Gen Name & Progress", CurrentValue = Config.ESP_GenNameProgress, Flag = "ESP_GenNameProgress", Callback = function(v) Config.ESP_GenNameProgress = v end})
TabESP:CreateToggle({Name = "Pallet", CurrentValue = Config.ESP_Pallet, Flag = "ESP_Pallet", Callback = function(v) Config.ESP_Pallet = v end})
TabESP:CreateColorPicker({Name = "Pallet Color", Color = Config.ESP_PalletColor, Flag = "ESP_PalletColor", Callback = function(v) Config.ESP_PalletColor = v end})
TabESP:CreateToggle({Name = "Window / Vault", CurrentValue = Config.ESP_Window, Flag = "ESP_Window", Callback = function(v) Config.ESP_Window = v end})
TabESP:CreateColorPicker({Name = "Window Color", Color = Config.ESP_WindowColor, Flag = "ESP_WindowColor", Callback = function(v) Config.ESP_WindowColor = v end})
TabESP:CreateToggle({Name = "Hook", CurrentValue = Config.ESP_Hook, Flag = "ESP_Hook", Callback = function(v) Config.ESP_Hook = v end})
TabESP:CreateColorPicker({Name = "Hook Color", Color = Config.ESP_HookColor, Flag = "ESP_HookColor", Callback = function(v) Config.ESP_HookColor = v end})
TabESP:CreateToggle({Name = "Esp Trap", CurrentValue = Config.ESP_Trap, Flag = "ESP_Trap", Callback = function(v) Config.ESP_Trap = v end})
TabESP:CreateColorPicker({Name = "Bear Trap Color", Color = Config.ESP_TrapColor, Flag = "ESP_TrapColor", Callback = function(v) Config.ESP_TrapColor = v end})
TabESP:CreateToggle({Name = "Esp Pumpkin", CurrentValue = Config.ESP_Pumpkin, Flag = "ESP_Pumpkin", Callback = function(v) Config.ESP_Pumpkin = v end})
TabESP:CreateColorPicker({Name = "Pumpkin Color", Color = Config.ESP_PumpkinColor, Flag = "ESP_PumpkinColor", Callback = function(v) Config.ESP_PumpkinColor = v end})
TabESP:CreateSection("World Effects")
TabESP:CreateToggle({Name = "Full Bright", CurrentValue = Config.FullBright, Flag = "FullBright", Callback = function(v) Config.FullBright = v end})
TabESP:CreateToggle({Name = "No Fog", CurrentValue = Config.NoFog, Flag = "NoFog", Callback = function(v) Config.NoFog = v end})
TabESP:CreateToggle({Name = "No Shadow", CurrentValue = Config.NoShadow, Flag = "NoShadow", Callback = function(v) Config.NoShadow = v end})
TabESP:CreateToggle({Name = "Low Grafik", CurrentValue = Config.LowGrafik, Flag = "LowGrafik", Callback = function(v) Config.LowGrafik = v end})
TabESP:CreateToggle({Name = "Clean Sky", CurrentValue = Config.CleanSky, Flag = "CleanSky", Callback = function(v) Config.CleanSky = v end})
TabESP:CreateSlider({Name = "Time Of Day", Range = {0, 24}, Increment = 1, CurrentValue = 14, Flag = "TimeOfDay", Callback = function(v) Config.TimeOfDay = v end})

local TabTeleport = Window:CreateTab("Teleport", 4483362458)
TabTeleport:CreateSection("Teleport Players")
TabTeleport:CreateDropdown({Name = "Pilih Player", Options = {"None"}, CurrentOption = {"None"}, Flag = "TP_Player", Callback = function(o) Config.TP_Player = o[1] end})
TabTeleport:CreateButton({Name = "REFRESH PLAYER", Callback = function()
    local plrs = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(plrs, p.Name) end
    end
end})
TabTeleport:CreateButton({Name = "TELEPORT KE PLAYER YANG DIPILIH", Callback = function()
    local target = Players:FindFirstChild(Config.TP_Player)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end})
TabTeleport:CreateSection("Teleport Maps")
TabTeleport:CreateButton({Name = "TP GENERATOR", Callback = function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name:lower():find("gen") or obj.Name:lower():find("fuse")) then
            local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if part and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                break
            end
        end
    end
end})
TabTeleport:CreateButton({Name = "TP HOOK (LOOP)", Callback = function() end})
TabTeleport:CreateButton({Name = "TP GATE (LOOP)", Callback = function() end})
TabTeleport:CreateButton({Name = "TP PALLET (LOOP)", Callback = function() end})
TabTeleport:CreateButton({Name = "TP WINDOW (LOOP)", Callback = function() end})
TabTeleport:CreateButton({Name = "REFRESH MAP", Callback = function() end})

local TabConfig = Window:CreateTab("Config", 4483362458)
TabConfig:CreateSection("Config Manager")
TabConfig:CreateInput({Name = "Config Name", PlaceholderText = "my config", RemoveTextAfterFocusLost = false, Callback = function(Text) end})
TabConfig:CreateDropdown({Name = "Configs", Options = {"none"}, CurrentOption = {"none"}, Callback = function(o) end})
TabConfig:CreateButton({Name = "SAVE CONFIG", Callback = function() end})
TabConfig:CreateButton({Name = "LOAD CONFIG", Callback = function() end})
TabConfig:CreateButton({Name = "DELETE CONFIG", Callback = function() end})
TabConfig:CreateSection("Troll Players")
TabConfig:CreateToggle({Name = "Tools Jerk", CurrentValue = Config.ToolsJerk, Flag = "ToolsJerk", Callback = function(v) Config.ToolsJerk = v end})
TabConfig:CreateToggle({Name = "Copy Avatar GUI", CurrentValue = Config.CopyAvatar, Flag = "CopyAvatar", Callback = function(v) Config.CopyAvatar = v end})
TabConfig:CreateToggle({Name = "Fly GUI", CurrentValue = Config.FlyGUI, Flag = "FlyGUI", Callback = function(v) Config.FlyGUI = v end})
TabConfig:CreateToggle({Name = "Noclip", CurrentValue = Config.Noclip, Flag = "Noclip", Callback = function(v) Config.Noclip = v end})
TabConfig:CreateToggle({Name = "Apply Korless", CurrentValue = Config.ApplyKorless, Flag = "ApplyKorless", Callback = function(v) Config.ApplyKorless = v end})
TabConfig:CreateToggle({Name = "Enable Speed Boost", CurrentValue = Config.SpeedBoost, Flag = "SpeedBoost", Callback = function(v) Config.SpeedBoost = v end})
TabConfig:CreateSlider({Name = "Speed Boost Value", Range = {1, 10}, Increment = 1, CurrentValue = 2, Flag = "SpeedVal", Callback = function(v) Config.SpeedVal = v end})

local TabInfo = Window:CreateTab("Info", 4483362458)
TabInfo:CreateSection("Info Player")
TabInfo:CreateToggle({Name = "FPS + Ping", CurrentValue = Config.InfoFPS, Flag = "InfoFPS", Callback = function(v) Config.InfoFPS = v end})
TabInfo:CreateToggle({Name = "Next Killer", CurrentValue = Config.InfoNextKiller, Flag = "InfoNextKiller", Callback = function(v) Config.InfoNextKiller = v end})
TabInfo:CreateToggle({Name = "Next Map", CurrentValue = Config.InfoNextMap, Flag = "InfoNextMap", Callback = function(v) Config.InfoNextMap = v end})
TabInfo:CreateToggle({Name = "Stun Indicator", CurrentValue = Config.InfoStun, Flag = "InfoStun", Callback = function(v) Config.InfoStun = v end})
TabInfo:CreateToggle({Name = "Show Killer Perks", CurrentValue = Config.InfoKillerPerks, Flag = "InfoKillerPerks", Callback = function(v) Config.InfoKillerPerks = v end})

local vim = game:GetService("VirtualInputManager")
local isHitting = false

local function CheckForSkillcheck()
    if not Config.AutoSkill or isHitting then return end
    
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return end
    
    for _, gui in pairs(pg:GetDescendants()) do
        if (gui:IsA("Frame") or gui:IsA("ImageLabel")) and gui.Visible then
            local absSize = gui.AbsoluteSize
            local absPos = gui.AbsolutePosition
            local screenSize = Camera.ViewportSize
            
            if absSize.X > 50 and absSize.X < 300 and absSize.Y > 50 and absSize.Y < 300 then
                local centerX = screenSize.X / 2
                local centerY = screenSize.Y / 2
                
                if math.abs(absPos.X - centerX) < 250 and math.abs(absPos.Y - centerY) < 250 then
                    isHitting = true
                    
                    if Config.SkillMode == "Legit" then task.wait(0.25) 
                    elseif Config.SkillMode == "Normal" then task.wait(0.15)
                    elseif Config.SkillMode == "Instan" then task.wait(0.08) end
                    
                    vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    task.wait(0.05)
                    vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                    
                    task.wait(0.5)
                    isHitting = false
                    break
                end
            end
        end
    end
end

local espCache = {}

local function ApplyHighlight(obj, color)
    if not obj then return end
    local hl = Instance.new("Highlight")
    hl.Name = "BH_Highlight"
    hl.Adornee = obj
    hl.FillColor = color
    hl.FillTransparency = 0.4
    hl.OutlineColor = color
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = obj
    return hl
end

local function IsKiller(plr)
    local char = plr.Character
    if not char then return false end
    if plr.Team and (plr.Team.Name:lower():find("killer")) then return true end
    if char:FindFirstChildWhichIsA("Tool") then return true end
    return false
end

RunService.RenderStepped:Connect(function()
    CheckForSkillcheck()

    if Config.CameraFOV then Camera.FieldOfView = Config.FOVValue end
    if Config.DBDCamera then
        Camera.CameraType = Enum.CameraType.Scriptable
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(hrp.Position - (hrp.CFrame.LookVector * Config.DBDDistance) + Vector3.new(0, 3, 0), hrp.Position), 0.2)
        end
    elseif not Config.DBDCamera and Camera.CameraType == Enum.CameraType.Scriptable then
        Camera.CameraType = Enum.CameraType.Custom
    end

    if Config.ESP_Enable then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local char = plr.Character
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local isKiller = IsKiller(plr)
                    local active = (isKiller and Config.ESP_Killer) or (not isKiller and Config.ESP_Survivor)
                    
                    if active then
                        local color = isKiller and Config.ESP_KillerColor or Config.ESP_PlayerColor
                        if not espCache[plr] or not espCache[plr].Parent then espCache[plr] = ApplyHighlight(char, color) end
                        espCache[plr].Enabled = true
                        espCache[plr].FillColor = color
                        espCache[plr].OutlineColor = color
                    elseif espCache[plr] then 
                        espCache[plr].Enabled = false 
                    end
                end
            end
        end
    end

    if Config.ESP_Gen then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") then
                local n = obj.Name:lower()
                if n:find("gen") or n:find("fuse") or n:find("repair") then
                    local primaryPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                    if primaryPart then
                        if not espCache[obj] then espCache[obj] = ApplyHighlight(obj, Config.ESP_GenColor) end
                        espCache[obj].Enabled = true
                    end
                elseif espCache[obj] and not (n:find("gen") or n:find("fuse") or n:find("repair")) then
                    if espCache[obj]:IsA("Highlight") then espCache[obj].Enabled = false end
                end
            end
        end
    end

    if Config.FullBright then
        Lighting.Brightness = 3
        Lighting.ClockTime = Config.TimeOfDay
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        local char = LocalPlayer.Character
        if char then
            if Config.Noclip then for _, v in pairs(char:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
        end
    end
end)

print("[BINTANGHUB] UI Loaded.")