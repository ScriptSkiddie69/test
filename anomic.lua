task.spawn(function()
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        queue_on_teleport([[]])
    end
end)
end)

local args = {
    [1] = "Sheriff"
}

game:GetService("ReplicatedStorage"):WaitForChild("_CS.Events"):WaitForChild("TeamChanger"):FireServer(unpack(args))
task(0.5)
local args = {
    [1] = "GetDebounceTime",
    [2] = "Sheriff Station"
}

game:GetService("ReplicatedStorage"):WaitForChild("_CS.Events"):WaitForChild("SpawnCharacter"):InvokeServer(unpack(args))
task.wait(0.5)
game.Players.LocalPlayer.Backpack['Equip Items'].Parent = game.Players.LocalPlayer.Character

local args = {
    [1] = game.Players.LocalPlayer.Character["Equip Items"]
}

game:GetService("ReplicatedStorage"):WaitForChild("_CS.Events"):WaitForChild("JobItemGiver"):FireServer(unpack(args))

task.wait(0.5)
game.Players.LocalPlayer.Backpack['Baton'].Parent = game.Players.LocalPlayer.Character
local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
while true do wait()
local printer = game.Workspace.Entities:FindFirstChild('Simple Printer') or game.Workspace.Entities:FindFirstChild('Hotwired Printer')
if not printer then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
local HttpService = game:GetService("HttpService")
local httprequest = (http and http.request) or http_request or (fluxus and fluxus.request) or request
local servers = {}
local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
local body = HttpService:JSONDecode(req.Body)

if body and body.data then
    for i, v in next, body.data do
        if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
            table.insert(servers, 1, v.id)
        end
    end
end

if #servers > 0 then
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = printer.PrimaryPart.CFrame
local args = {
    [1] = "DestroyPrinter",
    [2] = printer,
    [3] = printer
}

game:GetService("ReplicatedStorage"):WaitForChild("_CS.Events"):WaitForChild("ToolEvent"):FireServer(unpack(args))
end
