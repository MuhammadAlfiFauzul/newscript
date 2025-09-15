local url = "https://raw.githubusercontent.com/noirexe/berak/refs/heads/main/jembutatin.lua"
local s, e = pcall(function()
    return loadstring(game:HttpGet(url))()
end)

if not s then
    warn("Error load main.lua:", e)
end
