-- Pastikan RayField sudah di-load
local success, RayField = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    warn("Error loading RayField:", RayField)
    return
end

-- Membuat Window utama
local Window = RayField:CreateWindow({
    Name = "MT Auto Executor",
    LoadingTitle = "MT Auto Executor",
    LoadingSubtitle = "by AlfiFazulul",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    }
})

-- Membuat Tab utama
local MainTab = Window:CreateTab("Main", 4483362458)

-- Fungsi untuk memuat script dari URL
local function loadScriptFromURL(url, scriptName)
    local success, result = pcall(function()
        local httpContent = game:HttpGet(url, true)
        if not httpContent or httpContent == "" then
            error("Empty response from URL")
        end
        return loadstring(httpContent)()
    end)
    
    return success, result
end

-- Section untuk MT Atin
local AtinSection = MainTab:CreateSection("MT Atin")
local AtinButton = MainTab:CreateButton({
    Name = "Execute MT Atin",
    Callback = function()
        local url = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutatin.lua"
        local success, errorMsg = loadScriptFromURL(url, "MT Atin")
        
        if not success then
            warn("Error load MT Atin:", errorMsg)
            RayField:Notify({
                Title = "Error MT Atin",
                Content = "Gagal memuat MT Atin: " .. tostring(errorMsg),
                Duration = 6.5,
                Image = 4483362458
            })
        else
            RayField:Notify({
                Title = "Success",
                Content = "MT Atin berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        end
    end
})

-- Section untuk MT Yahayuk
local YahayukSection = MainTab:CreateSection("MT Yahayuk")
local YahayukButton = MainTab:CreateButton({
    Name = "Execute MT Yahayuk",
    Callback = function()
        local url = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua"
        local success, errorMsg = loadScriptFromURL(url, "MT Yahayuk")
        
        if not success then
            warn("Error load MT Yahayuk:", errorMsg)
            RayField:Notify({
                Title = "Error MT Yahayuk",
                Content = "Gagal memuat MT Yahayuk: " .. tostring(errorMsg),
                Duration = 6.5,
                Image = 4483362458
            })
        else
            RayField:Notify({
                Title = "Success",
                Content = "MT Yahayuk berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        end
    end
})

-- Section untuk eksekusi keduanya
local BothSection = MainTab:CreateSection("Execute Both")
local BothButton = MainTab:CreateButton({
    Name = "Execute Both MT",
    Callback = function()
        -- Eksekusi MT Atin
        local urlAtin = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutatin.lua"
        local success1, error1 = loadScriptFromURL(urlAtin, "MT Atin")
        
        -- Tunggu sebentar sebelum eksekusi kedua
        wait(0.5)
        
        -- Eksekusi MT Yahayuk
        local urlYahayuk = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua"
        local success2, error2 = loadScriptFromURL(urlYahayuk, "MT Yahayuk")
        
        if not success1 then
            warn("Error load MT Atin:", error1)
            RayField:Notify({
                Title = "Error MT Atin",
                Content = "Gagal memuat MT Atin: " .. tostring(error1),
                Duration = 6.5,
                Image = 4483362458
            })
        end
        
        if not success2 then
            warn("Error load MT Yahayuk:", error2)
            RayField:Notify({
                Title = "Error MT Yahayuk",
                Content = "Gagal memuat MT Yahayuk: " .. tostring(error2),
                Duration = 6.5,
                Image = 4483362458
            })
        end
        
        if success1 and success2 then
            RayField:Notify({
                Title = "Success",
                Content = "Kedua MT berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        elseif success1 or success2 then
            RayField:Notify({
                Title = "Partial Success",
                Content = "Salah satu MT berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        end
    end
})

-- Tambahkan credit section
local CreditSection = MainTab:CreateSection("Credits")
local CreditLabel = MainTab:CreateLabel("Script by AlfiFazulul")
local VersionLabel = MainTab:CreateLabel("Version 1.1 - Fixed")

RayField:Notify({
    Title = "MT Auto Executor Loaded",
    Content = "UI berhasil dimuat. Pilih MT yang ingin dijalankan.",
    Duration = 6.5,
    Image = 4483362458
})
