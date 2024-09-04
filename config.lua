Config = {}
-- 
Config.Kaupat = {
    {
        nimi = "Gun shop", -- Menu title
        Sijainti = vec3(-253.6844, -979.4166, 31.2200),-- Store location
        npc = "s_m_m_ammucountry",-- Npc model
        suunta = 90.0,-- Npc heading
        aseet = {
            {nimi = "WEAPON_PISTOL", hinta = 2500},-- weapons and prices can add as many you want
            {nimi = "WEAPON_SMG", hinta = 10000}
        }
    },
    {
        nimi = "Gun shop",
        Sijainti = vec3(-259.0846, -985.5211, 31.2194),
        npc = "s_m_m_ammucountry",
        suunta = 90.0,
        aseet = {
            {nimi = "WEAPON_PISTOL_MK2", hinta = 2500},
            {nimi = "WEAPON_MICROSMG", hinta = 10000}
        }
    },
    -- Add more shops here if needed
}
Config.DiscordWebhook = 'WEBHOOK HERE'-- webhook for logs

-- Menu
Config.icon = 'fa-solid fa-gun' -- menu icons
Config.iconColor = '#326ba8' -- icon colors
Config.menudesc = 'Price: $' -- menus description

-- Notifications
Config.Ilmotus = {
    Ostit = 'You bought ',-- You bought keep the space because gun label comes after this
    Sinullaonjo = 'You already have this gun', -- You already have this gun
    eitarpeeks = 'You dont have enought money', -- Not enought money
    apu = 'Press ~INPUT_CONTEXT~ to open gunshop' -- Help notification

}