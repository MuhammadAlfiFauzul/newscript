-- Pastikan RayField sudah di-load dengan benar
local RayField
local success, errorMsg = pcall(function()
    RayField = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    -- Fallback jika Rayfield gagal load
    warn("Error loading RayField:", errorMsg)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Error",
        Text = "Gagal memuat UI Library",
        Duration = 5
    })
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
        Enabled = false,
        Invite = "no_invite"
    }
})

-- Membuat Tab utama
local MainTab = Window:CreateTab("Main", 4483362458)

-- Fungsi untuk memuat script dengan error handling yang lebih baik
local function executeScript(url, scriptName)
    local success, errorMessage = pcall(function()
        -- Download script dari URL
        local response = game:HttpGet(url, true)
        if not response then
            error("Failed to download script from: " .. url)
        end
        
        -- Load dan execute script
        local loadedFunction = loadstring(response)
        if loadedFunction then
            loadedFunction()
        else
            error("Failed to load script from: " .. url)
        end
    end)
    
    return success, errorMessage
end

-- Section untuk MT Atin
local AtinSection = MainTab:CreateSection("MT Atin")
local AtinButton = MainTab:CreateButton({
    Name = "Execute MT Atin",
    Callback = function()
        local url = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutatin.lua"
        local success, errorMsg = executeScript(url, "MT Atin")
        
        if success then
            RayField:Notify({
                Title = "Success",
                Content = "MT Atin berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        else
            warn("Error load MT Atin:", errorMsg)
            RayField:Notify({
                Title = "Error MT Atin",
                Content = "Gagal memuat MT Atin: " .. tostring(errorMsg),
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
        local success, errorMsg = executeScript(url, "MT Yahayuk")
        
        if success then
            RayField:Notify({
                Title = "Success",
                Content = "MT Yahayuk berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        else
            warn("Error load MT Yahayuk:", errorMsg)
            RayField:Notify({
                Title = "Error MT Yahayuk",
                Content = "Gagal memuat MT Yahayuk: " .. tostring(errorMsg),
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
        local success1, error1 = executeScript(urlAtin, "MT Atin")
        
        -- Tunggu sebentar sebelum eksekusi kedua
        wait(0.5)
        
        -- Eksekusi MT Yahayuk
        local urlYahayuk = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua"
        local success2, error2 = executeScript(urlYahayuk, "MT Yahayuk")
        
        if success1 and success2 then
            RayField:Notify({
                Title = "Success",
                Content = "Kedua MT berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        else
            if not success1 then
                warn("Error load MT Atin:", error1)
            end
            if not success2 then
                warn("Error load MT Yahayuk:", error2)
            end
            RayField:Notify({
                Title = "Partial Success",
                Content = "Salah satu MT mungkin gagal dijalankan",
                Duration = 6.5,
                Image = 4483362458
            })
        end
    end
})

-- Tambahkan credit section
local CreditSection = MainTab:CreateSection("Credits")
MainTab:CreateLabel("Script by AlfiFazulul")
MainTab:CreateLabel("Version 1.2 - Fixed Loadstring Issue")

-- Notifikasi bahwa UI berhasil dimuat
RayField:Notify({
    Title = "MT Auto Executor Loaded",
    Content = "UI berhasil dimuat. Pilih MT yang ingin dijalankan.",
    Duration = 5,
    Image = 4483362458
})

print("MT Auto Executor UI successfully loaded!")
