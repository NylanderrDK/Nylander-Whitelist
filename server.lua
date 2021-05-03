AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    deferrals.defer()
    local source = source
    local identifier = nil

    deferrals.update(Config.CheckingWhitelist)
    Citizen.Wait(100)

    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(v, "license:") then
            identifier = string.sub(v, 9)
            break
        end
    end

    CreateID(identifier)
    local id = GetID(identifier)

    if CheckWhitelist(identifier) == 1 then
        deferrals.done()
    else
        deferrals.done(Config.NotWhitelisted .. " (ID: " .. id .. ")")
    end
end)

function CreateID(license)
    MySQL.Sync.execute("INSERT IGNORE INTO whitelist (identifier) VALUES (@license)", { ["@license"] = license }, function(affectedRows)
    end)
end

function GetID(license)
    for k, v in ipairs(MySQL.Sync.fetchAll("SELECT id FROM whitelist WHERE identifier = @license", { ["@license"] = license })) do
        return v.id
    end
end

function CheckWhitelist(identifier)
    for k, v in ipairs(MySQL.Sync.fetchAll("SELECT whitelisted FROM whitelist WHERE identifier = @identifier", { ["@identifier"] = identifier })) do
        return v.whitelisted
    end
end