local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Membuat window utama
local Window = Rayfield:CreateWindow({
    Name = "MT Manager - Fixed",
    LoadingTitle = "MT Manager",
    LoadingSubtitle = "Dengan Error Handling yang Lebih Baik",
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
    
    -- Menggunakan task.spawn untuk mencegah blocking UI
    task.spawn(function()
        local success, result = pcall(function()
            local scriptContent = game:HttpGet(url, true)
            if not scriptContent or scriptContent == "" then
                error("Script kosong atau tidak dapat diunduh")
            end
            
            -- Memeriksa kode sebelum dijalankan
            if scriptContent:find("attempt to call a nil value") then
                error("Script mengandung potensi error: attempt to call a nil value")
            end
            
            local loadedFunction = loadstring(scriptContent)
            if not loadedFunction then
                error("Gagal mengkompilasi script")
            end
            
            return loadedFunction()
        end)

        if not success then
            warn("Error load " .. scriptName .. ":", result)
            Rayfield:Notify({
                Title = "Error",
                Content = "Gagal memuat " .. scriptName .. ": " .. tostring(result),
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
    Name = "Tambahkan MT Atin (Fixed)",
    Callback = function()
        loadScript(
            "https://raw.githubusercontent.com/noirexe/berak/refs/heads/main/jembutatin.lua",
            "MT Atin"
        )
    end,
})

-- Membuat button untuk MT Atin Alternatif
local AtinAltButton = MainTab:CreateButton({
    Name = "MT Atin (Alternatif)",
    Callback = function()
        loadScript(
            "https://raw.githubusercontent.com/noirexe/berak/main/jembutatin.lua",
            "MT Atin Alternatif"
        )
    end,
})

-- Membuat section untuk MT Yahayuk
local YahayukSection = MainTab:CreateSection("MT Yahayuk")

-- Membuat button untuk MT Yahayuk
local YahayukButton = MainTab:CreateButton({
    Name = "Tambahkan MT Yahayuk",
    Callback = function()
        loadScript(
            "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua",
            "MT Yahayuk"
        )
    end,
})

-- Membuat tab informasi
local InfoTab = Window:CreateTab("Info", 4483362458)

-- Menambahkan informasi
InfoTab:CreateParagraph({
    Title = "Informasi MT Manager - Fixed",
    Content = "UI ini telah diperbaiki dengan error handling yang lebih baik.\n\nError sebelumnya: 'attempt to call a nil value' pada baris 78 script MT Atin.\n\nCoba gunakan opsi alternatif jika salah satu script tidak bekerja."
})

-- Membuat tab troubleshooting
local TroubleshootTab = Window:CreateTab("Troubleshoot", 4483362458)

TroubleshootTab:CreateParagraph({
    Title = "Solusi untuk Error",
    Content = "1. Coba gunakan opsi alternatif\n2. Pastikan koneksi internet stabil\n3. Script mungkin perlu update oleh developer\n4. Error 'nil value' berarti ada fungsi yang tidak terdefinisi di script"
})

-- Menambahkan tombol untuk memeriksa koneksi
TroubleshootTab:CreateButton({
    Name = "Test Koneksi GitHub",
    Callback = function()
        local success = pcall(function()
            game:HttpGet("https://github.com")
        end)
        
        if success then
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

-- Menampilkan window
Rayfield:Notify({
    Title = "MT Manager Dimuat",
    Content = "Versi dengan error handling yang diperbaiki!",
    Duration = 6.5,
    Image = 4483362458,
})
