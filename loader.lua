local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Membuat window utama
local Window = Rayfield:CreateWindow({
    Name = "MT Manager",
    LoadingTitle = "MT Manager",
    LoadingSubtitle = "by Script Manager",
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

-- Membuat tab utama
local MainTab = Window:CreateTab("Main", 4483362458)

-- Membuat section untuk MT Atin
local AtinSection = MainTab:CreateSection("MT Atin")

-- Membuat button untuk MT Atin
local AtinButton = MainTab:CreateButton({
    Name = "Tambahkan MT Atin",
    Callback = function()
        Rayfield:Notify({
            Title = "Memuat MT Atin",
            Content = "Sedang memuat MT Atin, harap tunggu...",
            Duration = 3,
            Image = 4483362458,
        })
        
        local url = "https://raw.githubusercontent.com/noirexe/berak/refs/heads/main/jembutatin.lua"
        local s, e = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)

        if not s then
            warn("Error load main.lua:", e)
            Rayfield:Notify({
                Title = "Error",
                Content = "Gagal memuat MT Atin: " .. tostring(e),
                Duration = 6.5,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Sukses",
                Content = "MT Atin berhasil dimuat!",
                Duration = 6.5,
                Image = 4483362458,
            })
        end
    end,
})

-- Membuat section untuk MT Yahayuk
local YahayukSection = MainTab:CreateSection("MT Yahayuk")

-- Membuat button untuk MT Yahayuk
local YahayukButton = MainTab:CreateButton({
    Name = "Tambahkan MT Yahayuk",
    Callback = function()
        Rayfield:Notify({
            Title = "Memuat MT Yahayuk",
            Content = "Sedang memuat MT Yahayuk, harap tunggu...",
            Duration = 3,
            Image = 4483362458,
        })
        
        local url = "https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua"
        local s, e = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)

        if not s then
            warn("Error load main.lua:", e)
            Rayfield:Notify({
                Title = "Error",
                Content = "Gagal memuat MT Yahayuk: " .. tostring(e),
                Duration = 6.5,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Sukses",
                Content = "MT Yahayuk berhasil dimuat!",
                Duration = 6.5,
                Image = 4483362458,
            })
        end
    end,
})

-- Membuat tab informasi
local InfoTab = Window:CreateTab("Info", 4483362458)

-- Menambahkan informasi
InfoTab:CreateParagraph({
    Title = "Informasi MT Manager",
    Content = "Gunakan tombol di tab Main untuk menambahkan MT Atin atau MT Yahayuk secara manual.\n\nPastikan Anda memiliki koneksi internet yang stabil untuk mengunduh script dari GitHub."
})

-- Menambahkan keybind untuk toggle UI (opsional)
local ToggleSection = MainTab:CreateSection("Pengaturan UI")
MainTab:CreateKeybind({
    Name = "Toggle UI",
    CurrentKeybind = "RightShift",
    HoldToInteract = false,
    Flag = "ToggleUIKeybind",
    Callback = function(Keybind)
        Rayfield:Toggle()
    end,
})

-- Menampilkan window
Rayfield:Notify({
    Title = "MT Manager Dimuat",
    Content = "Selamat menggunakan MT Manager!",
    Duration = 6.5,
    Image = 4483362458,
})