local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Membuat window utama
local Window = Rayfield:CreateWindow({
    Name = "MT Manager - Ultimate Fix",
    LoadingTitle = "MT Manager",
    LoadingSubtitle = "Dengan Perbaikan Kompilasi Script",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MTManager",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvite",
        RememberJoins = true
    },
    KeySystem = false,
})

-- Fungsi untuk memuat script dengan error handling yang lebih baik
local function loadScript(url, scriptName)
    Rayfield:Notify({
        Title = "Memuat " .. scriptName,
        Content = "Sedang memuat script, harap tunggu...",
        Duration = 3,
        Image = 4483362458,
    })
    
    task.spawn(function()
        local success, result = pcall(function()
            -- Menggunakan syn.request untuk menghindari blokade
            local response = syn and syn.request or request
            if not response then
                error("HTTP request function tidak tersedia")
            end
            
            local httpResponse = response({
                Url = url,
                Method = "GET",
                Headers = {
                    ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
                }
            })
            
            if not httpResponse or not httpResponse.Body then
                error("Tidak dapat mengunduh script dari GitHub")
            end
            
            local scriptContent = httpResponse.Body
            if not scriptContent or scriptContent == "" then
                error("Script kosong atau tidak dapat diunduh")
            end
            
            -- Membersihkan script dari karakter yang mungkin menyebabkan error
            scriptContent = scriptContent:gsub("AllowThirdPartySales", "ThirdPartySales")
            scriptContent = scriptContent:gsub("enablebAliowthirdPartySales", "enableThirdPartySales")
            
            -- Memeriksa kode sebelum dijalankan
            if scriptContent:find("attempt to call a nil value") then
                error("Script mengandung potensi error: attempt to call a nil value")
            end
            
            -- Menggunakan loadstring dengan environment yang lebih aman
            local loadedFunction = loadstring(scriptContent)
            if not loadedFunction then
                error("Gagal mengkompilasi script - sintaks error")
            end
            
            -- Menetapkan environment yang aman
            local env = getfenv and getfenv() or {}
            setfenv(loadedFunction, setmetatable(env, {__index = _G}))
            
            return loadedFunction()
        end)

        if not success then
            warn("Error load " .. scriptName .. ":", result)
            Rayfield:Notify({
                Title = "Error",
                Content = "Gagal memuat " .. scriptName .. ": " .. tostring(result):sub(1, 100) .. "...",
                Duration = 8,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Sukses",
                Content = scriptName .. " berhasil dimuat!",
                Duration = 6.5,
                Image = 4483362458,
            })
        end
    end)
end

-- Membuat tab utama
local MainTab = Window:CreateTab("Main", 4483362458)

-- Membuat section untuk MT Atin
local AtinSection = MainTab:CreateSection("MT Atin")

-- Membuat button untuk MT Atin
local AtinButton = MainTab:CreateButton({
    Name = "Tambahkan MT Atin",
    Callback = function()
        loadScript(
            "https://raw.githubusercontent.com/noirexe/berak/refs/heads/main/jembutatin.lua",
            "MT Atin"
        )
    end,
})

-- Membuat section untuk MT Yahayuk
local YahayukSection = MainTab:CreateSection("MT Yahayuk")

-- Membuat button untuk MT Yahayuk
local YahayukButton = MainTab:CreateButton({
    Name = "Tambahkan MT Yahayuk (Fixed)",
    Callback = function()
        loadScript(
            "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua",
            "MT Yahayuk"
        )
    end,
})

-- Button alternatif untuk MT Yahayuk
local YahayukAltButton = MainTab:CreateButton({
    Name = "MT Yahayuk (Alternatif)",
    Callback = function()
        loadScript(
            "https://raw.githubusercontent.com/AlfiFazulul/script/main/jembutyahayuk.lua",
            "MT Yahayuk Alternatif"
        )
    end,
})

-- Membuat tab troubleshooting
local TroubleshootTab = Window:CreateTab("Troubleshoot", 4483362458)

TroubleshootTab:CreateParagraph({
    Title = "Solusi untuk Error Kompilasi",
    Content = "Error 'Gagal mengkompilasi script' biasanya disebabkan oleh:\n\n1. Karakter khusus dalam script\n2. Blokade dari Roblox terhadap pihak ketiga\n3. Syntax error dalam script\n4. Masalah koneksi internet"
})

-- Menambahkan tombol untuk memeriksa koneksi
TroubleshootTab:CreateButton({
    Name = "Test Koneksi GitHub",
    Callback = function()
        local success, message = pcall(function()
            local response = syn and syn.request or request
            if response then
                local result = response({
                    Url = "https://github.com",
                    Method = "GET"
                })
                return result.StatusCode == 200
            end
            return false
        end)
        
        if success and message then
            Rayfield:Notify({
                Title = "Koneksi Baik",
                Content = "Koneksi ke GitHub berhasil!",
                Duration = 5,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Koneksi Error",
                Content = "Tidak dapat terhubung ke GitHub",
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

-- Menambahkan tombol untuk clear output jika perlu
TroubleshootTab:CreateButton({
    Name = "Bersihkan Output",
    Callback = function()
        if game:GetService("LogService"):ClearLog() then
            Rayfield:Notify({
                Title = "Output Dibersihkan",
                Content = "Output console telah dibersihkan",
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

-- Tab informasi
local InfoTab = Window:CreateTab("Info", 4483362458)

InfoTab:CreateParagraph({
    Title = "Informasi Perbaikan",
    Content = "UI ini telah diperbaiki untuk menangani error:\n1. 'attempt to call a nil value'\n2. 'Gagal mengkompilasi script'\n3. Blokade AllowThirdPartySales\n\nMenggunakan teknik request yang lebih aman dan pembersihan script."
})

-- Menampilkan window
Rayfield:Notify({
    Title = "MT Manager Ultimate Fix Dimuat",
    Content = "Telah diperbaiki untuk error kompilasi script!",
    Duration = 6.5,
    Image = 4483362458,
})

-- Auto-clear output saat mulai
task.spawn(function()
    wait(2)
    pcall(function()
        game:GetService("LogService"):ClearLog()
    end)
end)
