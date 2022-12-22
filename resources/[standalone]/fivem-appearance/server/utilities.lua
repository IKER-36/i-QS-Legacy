-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local curVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
local resourceName = "fivem-appearance"

CreateThread(function()
    if GetCurrentResourceName() ~= "fivem-appearance" then
        resourceName = "fivem-appearance (" .. GetCurrentResourceName() .. ")"
        print("^0[^3WARNING^0] Rename the folder to \"fivem-appearance\", otherwise the resource will NOT work properly")
    end

    while true do
        PerformHttpRequest("https://api.github.com/repos/wasabirobby/fivem-appearance/releases/latest", CheckVersion, "GET")
        Wait(3600000)
    end
end)

CheckVersion = function(err, responseText, headers)
    local repoVersion, repoURL = GetRepoInformations()

    CreateThread(function()
        if curVersion ~= repoVersion then
            Wait(4000)
            print("^0[^3WARNING^0] " .. resourceName .. " is ^1NOT ^0up to date!")
            print("^0[^3WARNING^0] Your Version: ^1" .. curVersion .. "^0")
            print("^0[^3WARNING^0] Latest Version: ^2" .. repoVersion .. "^0")
            print("^0[^3WARNING^0] Get the latest Version from: ^2" .. repoURL .. "^0")
        end
    end)
end

GetRepoInformations = function()
    local repoVersion, repoURL = curVersion, "https://github.com/wasabirobby/fivem-appearance"

    PerformHttpRequest("https://api.github.com/repos/wasabirobby/fivem-appearance/releases/latest", function(err, response, headers)
        if err == 200 then
            local data = json.decode(response)

            repoVersion = data.tag_name
            repoURL = data.html_url
        end
    end, "GET")

    repeat
        Wait(50)
    until (repoVersion and repoURL)

    return repoVersion, repoURL
end
