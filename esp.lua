local _Character = getrenv()._G.Character;

function Simple_Create(base, name, trackername, color, studs)
    local bb = Instance.new('BillboardGui', game.CoreGui)
    bb.Adornee = base
    bb.ExtentsOffset = Vector3.new(0,1,0)
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0,6,0,6)
    bb.StudsOffset = Vector3.new(0,1,0)
    bb.Name = trackername
    
    local SleeperCheck = v.Parent.UpperTorso.CFrame.Y - v.Parent.LowerTorso.CFrame.Y
    
    local txtlbl = Instance.new('TextLabel', bb)
    txtlbl.ZIndex = 10
    txtlbl.BackgroundTransparency = 1
    txtlbl.Position = UDim2.new(0,0,0,-29)
    txtlbl.Size = UDim2.new(1,0,10,0)
    txtlbl.Font = 'ArialBold'
    txtlbl.FontSize = 'Size12'
    local actualtext
    if SleeperCheck > 0.3 then
        actualtext = name .. " [" .. tostring(studs) .. " Studs]"
    else
        name .. " [" .. tostring(studs) .. " Studs] " .. "(Sleeper)"
    end
    txtlbl.Text = actualtext
    txtlbl.TextStrokeTransparency = 0.5
    txtlbl.TextColor3 = color
end

-- Clear ESP
function Simple_ClearESP(espname)
    for _,v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == espname and v:isA('BillboardGui') then
            v:Destroy()
        end
    end
end

getgenv().SESP_Create = Simple_Create;
getgenv().SESP_Clear = Simple_ClearESP;

-- Example:
-- Part/Instance, Display Name, Esp Name, Color of ESP, Studs (Can be calculated using Plr:DistanceFromCharacter())
-- SESP_Create(v.Character.Head, v.Name, "playertracker", Color3, math.floor(studs + 0.5))
-- SESP_Clear("playertracker");
