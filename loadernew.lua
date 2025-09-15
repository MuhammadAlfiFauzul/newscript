-- Pastikan RayField sudah di-load
local RayField = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

-- Section untuk MT Atin
local AtinSection = MainTab:CreateSection("MT Atin")
local AtinButton = MainTab:CreateButton({
    Name = "Execute MT Atin",
    Callback = function()
        local url = "https://raw.githubusercontent.com/MuhammadAlfiFauzul/script/refs/heads/main/jembutatin.lua"
        local s, e = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)

        if not s then
            warn("Error load MT Atin:", e)
            RayField:Notify({
                Title = "Error",
                Content = "Gagal memuat MT Atin: " .. tostring(e),
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
        local url = "https://raw.githubusercontent.com/MuhammadAlfiFauzul/script/refs/heads/main/jembutyahayuk.lua"
        local s, e = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)

        if not s then
            warn("Error load MT Yahayuk:", e)
            RayField:Notify({
                Title = "Error",
                Content = "Gagal memuat MT Yahayuk: " .. tostring(e),
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
        local s1, e1 = pcall(function()
            return loadstring(game:HttpGet(urlAtin))()
        end)

        -- Tunggu sebentar sebelum eksekusi kedua
        wait(1)
        
        -- Eksekusi MT Yahayuk
        local urlYahayuk = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua"
        local s2, e2 = pcall(function()
            return loadstring(game:HttpGet(urlYahayuk))()
        end)

        if not s1 then
            warn("Error load MT Atin:", e1)
            RayField:Notify({
                Title = "Error MT Atin",
                Content = "Gagal memuat MT Atin: " .. tostring(e1),
                Duration = 6.5,
                Image = 4483362458
            })
        end
        
        if not s2 then
            warn("Error load MT Yahayuk:", e2)
            RayField:Notify({
                Title = "Error MT Yahayuk",
                Content = "Gagal memuat MT Yahayuk: " .. tostring(e2),
                Duration = 6.5,
                Image = 4483362458
            })
        end
        
        if s1 and s2 then
            RayField:Notify({
                Title = "Success",
                Content = "Kedua MT berhasil dijalankan!",
                Duration = 6.5,
                Image = 4483362458
            })
        end
    end
})
