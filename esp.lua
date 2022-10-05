function Simple_Create(pos, name, color, studs)
    local line = Drawing.new("Text")
    line.Text = name .. " [" .. tostring(studs) .. " Studs] "
    line.Transparency = 1
    line.Size = 3
    line.Position = pos
    line.color = color
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
